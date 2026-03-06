# Favicon 显示问题排查指南

## 问题描述
favicon 已开启显示，但是首页没有显示 favicon。

## 可能的原因

### 1. Huey 队列服务未运行
favicon 是通过 Huey 队列任务异步加载的。如果队列服务没有运行，任务就不会被执行。

**检查方法：**
```bash
# 检查是否有 Huey consumer 进程在运行
ps aux | grep run_huey

# 或者检查进程
ps aux | grep huey
```

**解决方法：**
- 如果使用 Docker，确保容器中 Huey consumer 正在运行
- 如果使用 supervisor，检查 `supervisord` 状态
- 开发环境，需要手动运行：`python manage.py run_huey`

### 2. 后台任务被禁用
如果 `LD_DISABLE_BACKGROUND_TASKS` 环境变量设置为 `True`，favicon 任务不会被执行。

**检查方法：**
```bash
# 检查环境变量
echo $LD_DISABLE_BACKGROUND_TASKS
```

**解决方法：**
- 确保 `LD_DISABLE_BACKGROUND_TASKS` 未设置或设置为 `False`

### 3. 任务已创建但未执行
任务可能已经在队列中，但还没有被执行。

**检查方法：**
```python
# 在 Django shell 中检查
python manage.py shell
>>> from huey.contrib.djhuey import HUEY
>>> # 检查待执行的任务数量
>>> print(HUEY.pending_count())
```

### 4. favicon_file 字段为空
书签的 `favicon_file` 字段可能还没有被填充。

**检查方法：**
```python
# 在 Django shell 中检查
python manage.py shell
>>> from bookmarks.models import Bookmark
>>> from django.contrib.auth.models import User
>>> user = User.objects.first()
>>> bookmarks_without_favicon = Bookmark.objects.filter(owner=user, favicon_file__exact="")
>>> print(f"没有 favicon 的书签数量: {bookmarks_without_favicon.count()}")
```

### 5. 手动触发 favicon 加载
如果任务没有自动执行，可以手动触发：

**方法 1：通过设置页面**
1. 进入设置页面
2. 如果已启用 favicon，点击 "Refresh Favicons" 按钮

**方法 2：通过 Django shell**
```python
python manage.py shell
>>> from bookmarks.services import tasks
>>> from django.contrib.auth.models import User
>>> user = User.objects.first()
>>> # 为所有没有 favicon 的书签调度任务
>>> tasks.schedule_bookmarks_without_favicons(user)
>>> # 或者刷新所有 favicon
>>> tasks.schedule_refresh_favicons(user)
```

### 6. 检查 favicon 文件是否存在
即使 `favicon_file` 字段有值，文件可能不存在。

**检查方法：**
```python
python manage.py shell
>>> from django.conf import settings
>>> import os
>>> bookmark = Bookmark.objects.first()
>>> if bookmark.favicon_file:
>>>     favicon_path = os.path.join(settings.LD_FAVICON_FOLDER, bookmark.favicon_file)
>>>     print(f"Favicon 文件路径: {favicon_path}")
>>>     print(f"文件是否存在: {os.path.exists(favicon_path)}")
```

### 7. 检查日志
查看应用日志，查找 favicon 加载相关的错误信息：

```bash
# 查看日志文件（如果使用文件日志）
tail -f logs/django.log

# 或者查看 Docker 日志
docker logs <container_name>
```

查找包含以下关键词的日志：
- "Load favicon for bookmark"
- "Successfully updated favicon"
- "Failed to load favicon"

## 快速诊断脚本

创建一个诊断脚本来检查所有可能的问题：

```python
# check_favicon.py
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'bookmarks.settings.dev')
django.setup()

from django.conf import settings
from django.contrib.auth.models import User
from bookmarks.models import Bookmark

print("=== Favicon 诊断 ===")
print()

# 1. 检查后台任务是否启用
print(f"1. LD_DISABLE_BACKGROUND_TASKS: {settings.LD_DISABLE_BACKGROUND_TASKS}")
print()

# 2. 检查用户配置
user = User.objects.first()
if user:
    print(f"2. 用户: {user.username}")
    print(f"   enable_favicons: {user.profile.enable_favicons}")
    print()

# 3. 检查书签状态
if user:
    bookmarks = Bookmark.objects.filter(owner=user)
    total = bookmarks.count()
    with_favicon = bookmarks.exclude(favicon_file__exact="").count()
    without_favicon = bookmarks.filter(favicon_file__exact="").count()
    
    print(f"3. 书签统计:")
    print(f"   总数: {total}")
    print(f"   有 favicon: {with_favicon}")
    print(f"   无 favicon: {without_favicon}")
    print()

# 4. 检查 favicon 文件夹
favicon_folder = settings.LD_FAVICON_FOLDER
print(f"4. Favicon 文件夹: {favicon_folder}")
print(f"   文件夹是否存在: {os.path.exists(favicon_folder)}")
if os.path.exists(favicon_folder):
    files = os.listdir(favicon_folder)
    print(f"   文件数量: {len(files)}")
    if files:
        print(f"   示例文件: {files[0]}")
print()

# 5. 检查示例书签
if user:
    bookmark = bookmarks.first()
    if bookmark:
        print(f"5. 示例书签:")
        print(f"   URL: {bookmark.url}")
        print(f"   favicon_file: {bookmark.favicon_file or '(空)'}")
        if bookmark.favicon_file:
            favicon_path = os.path.join(favicon_folder, bookmark.favicon_file)
            print(f"   文件路径: {favicon_path}")
            print(f"   文件存在: {os.path.exists(favicon_path)}")
```

运行诊断脚本：
```bash
python check_favicon.py
```

## 常见解决方案

### 方案 1：启动 Huey Consumer
```bash
# 开发环境
python manage.py run_huey

# 生产环境（使用 supervisor）
supervisorctl start jobs

# Docker 环境
# 确保容器中 Huey consumer 正在运行
```

### 方案 2：手动触发 favicon 加载
```python
python manage.py shell
>>> from bookmarks.services import tasks
>>> from django.contrib.auth.models import User
>>> user = User.objects.first()
>>> tasks.schedule_bookmarks_without_favicons(user)
```

### 方案 3：检查并修复文件权限
```bash
# 确保 favicon 文件夹有写权限
chmod -R 755 data/favicons
chown -R www-data:www-data data/favicons  # 根据实际用户调整
```

## 注意事项

1. **favicon 加载是异步的**：启用 favicon 后，需要等待队列任务执行，可能需要几分钟时间
2. **需要网络连接**：favicon 是从外部服务（默认是 Google）下载的，需要网络连接
3. **任务重试机制**：如果任务失败，Huey 会自动重试（最多 5 次）
4. **批量处理**：如果有很多书签，favicon 加载可能需要较长时间
