# Changelog

## v1.45.0.2 (23/03/2026)

### What's Changed
* 批量操作：将选中书签复制为 Markdown 到剪贴板；格式为列表项 `- [标题](url)`，有描述时为缩进行 `  > …`（多行则多行 `  >`），不含标签，无描述则不输出引用；独立按钮位于「执行」右侧，无需二次确认
* 设置 → 常规：「书签操作」下查看 / 编辑 / 归档 / 删除四个复选框横向排列，窄宽度时自动换行
* 修复批量编辑全选：缺失 `bulk-edit-active-toggle` 时不再因脚本错误导致全选/行选失效；列表更新后尽量保留已选书签
* 复制 Markdown 在非 HTTPS 等环境下增加剪贴板写入回退（`execCommand`）
* 简体中文：修正合并标签弹框、批量「全部 N 个书签」等因 fuzzy 未生效的译文；补充相关文案

---

## v1.45.0.1 (06/03/2026)

### What's Changed
* 基于 v1.45.0，合并了 linkding-cn 的核心功能
* 添加中文本地化支持（简体中文）
* 添加日期筛选功能（绝对/相对时间）
* 添加搜索范围限定功能
* 添加随机排序功能
* 添加标签状态筛选功能
* Bundle 添加日期按相对时间筛选
* 优化书签标题获取（支持 og:title、twitter:title）
* 优化 favicon 获取（支持 SVG 格式）

---

## v1.45.0 (06/01/2026)

### What's Changed
* API token management by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1248
* Add option to disable login form by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1269
* Turn scheme-less URLs into HTTPS instead of HTTP links by @Maaxxs in https://github.com/sissbruecker/linkding/pull/1225
* Disable bulk execute button when no bookmarks selected by @emanuelebeffa in https://github.com/sissbruecker/linkding/pull/1241
* Add option to run supervisor as main process by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1270
* Allow setting date_added and date_modified for new bookmarks through REST API by @jmason in https://github.com/sissbruecker/linkding/pull/1063
* Download PDF instead of creating HTML snapshot if URL points at PDF by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1271
* Allow sandboxed scripts when viewing assets by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1252
* Allow viewing video assets by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1259
* Remove absolute URIs from settings page by @packrat386 in https://github.com/sissbruecker/linkding/pull/1261
* Move tag management forms into dialogs by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1253
* Move bulk edit checkboxes into bookmark list container by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1257
* Remove registration switch by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1268
* Add linkdinger to community projects by @lmmendes in https://github.com/sissbruecker/linkding/pull/1266

### New Contributors
* @packrat386 made their first contribution in https://github.com/sissbruecker/linkding/pull/1261
* @lmmendes made their first contribution in https://github.com/sissbruecker/linkding/pull/1266
* @Maaxxs made their first contribution in https://github.com/sissbruecker/linkding/pull/1225
* @emanuelebeffa made their first contribution in https://github.com/sissbruecker/linkding/pull/1241
* @jmason made their first contribution in https://github.com/sissbruecker/linkding/pull/1063

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.44.2...v1.45.0

---

## v1.44.2 (13/12/2025)

### What's Changed

> [!WARNING] 
> *This resolves a [security vulnerability](https://github.com/sissbruecker/linkding/security/advisories/GHSA-3pf9-5cjv-2w7q) in linkding. Everyone is encouraged to upgrade to the latest version as soon as possible.*

* Use sandbox CSP for viewing assets by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1245
* Fix devcontainer by @m3eno in https://github.com/sissbruecker/linkding/pull/1208
* Fix tag cloud highlighting first char when tags are not grouped by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1209
* Bump supervisor to 4.3.0 to fix warning by @simonhammes in https://github.com/sissbruecker/linkding/pull/1216
* Added Javascript client and library for Linkding REST API by @vbsampath in https://github.com/sissbruecker/linkding/pull/1195
* Add Komrade project to community resources by @dev-inside in https://github.com/sissbruecker/linkding/pull/1236

### New Contributors
* @m3eno made their first contribution in https://github.com/sissbruecker/linkding/pull/1208
* @vbsampath made their first contribution in https://github.com/sissbruecker/linkding/pull/1195
* @dev-inside made their first contribution in https://github.com/sissbruecker/linkding/pull/1236
* @simonhammes made their first contribution in https://github.com/sissbruecker/linkding/pull/1216

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.44.1...v1.44.2

---

## v1.44.1 (11/10/2025)

### What's Changed
* Fix normalized URL not being generated in bookmark import by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1202
* Fix missing tags causing errors in import with Postgres by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1203
* Check for dupes by exact URL if normalized URL is missing by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1204
* Attempt to fix botched normalized URL migration from 1.43.0 by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1205


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.44.0...v1.44.1

---

## v1.44.0 (05/10/2025)

### What's Changed
* Add new search engine that supports logical expressions (and, or, not) by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1198
* Fix pagination links to use relative URLs by @dunlor in https://github.com/sissbruecker/linkding/pull/1186
* Fix queued tasks link when context path is used by @dunlor in https://github.com/sissbruecker/linkding/pull/1187
* Fix bundle preview pagination resetting to first page by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1194

### New Contributors
* @dunlor made their first contribution in https://github.com/sissbruecker/linkding/pull/1186

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.43.0...v1.44.0

---

## v1.43.0 (28/09/2025)

### What's Changed
* Add basic tag management by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1175
* Normalize URLs when checking for duplicates by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1169
* Add option to mark bookmarks as shared by default by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1170
* Use modal dialog for confirming actions by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1168
* Fix error when filtering bookmark assets in the admin UI by @proog in https://github.com/sissbruecker/linkding/pull/1162
* Document API bundle filter by @proog in https://github.com/sissbruecker/linkding/pull/1161
* Add alfred-linkding-bookmarks to community.md by @FireFingers21 in https://github.com/sissbruecker/linkding/pull/1160
* Switch to uv by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1172
* Replace Svelte components with Lit elements by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1174
* Bump versions by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1173
* Bump astro from 5.12.8 to 5.13.2 in /docs by @dependabot[bot] in https://github.com/sissbruecker/linkding/pull/1166
* Bump vite from 6.3.5 to 6.3.6 in /docs by @dependabot[bot] in https://github.com/sissbruecker/linkding/pull/1184

### New Contributors
* @FireFingers21 made their first contribution in https://github.com/sissbruecker/linkding/pull/1160

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.42.0...v1.43.0

---

## v1.42.0 (16/08/2025)

### What's Changed
* Bulk create HTML snapshots by @Tql-ws1 in https://github.com/sissbruecker/linkding/pull/1132
* Create bundle from current search query by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1154
* Add alternative bookmarklet that uses browser metadata by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1159
* Add date and time to HTML export filename by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1101
* Automatically compress uploads with gzip by @hkclark in https://github.com/sissbruecker/linkding/pull/1087
* Show bookmark bundles in admin by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1110
* Allow filtering feeds by bundle by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1152
* Submit bookmark form with Ctrl/Cmd + Enter by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1158
* Improve bookmark form accessibility by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1116
* Fix custom CSS not being used in reader mode by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1102
* Use filename when downloading asset through UI by @proog in https://github.com/sissbruecker/linkding/pull/1146
* Update order when deleting bundle by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1114
* Wrap long titles in bookmark details modal by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1150
* Ignore tags with just whitespace by @pvl in https://github.com/sissbruecker/linkding/pull/1125
* Ignore tags that exceed length limit during import by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1153
* Add CloudBreak on Managed Hosting by @benjaminoakes in https://github.com/sissbruecker/linkding/pull/1079
* Add Pocket migration to to community page by @hkclark in https://github.com/sissbruecker/linkding/pull/1112
* Add linkding-media-archiver to community.md by @proog in https://github.com/sissbruecker/linkding/pull/1144
* Bump astro from 5.7.13 to 5.12.8 in /docs by @dependabot[bot] in https://github.com/sissbruecker/linkding/pull/1147

### New Contributors
* @hkclark made their first contribution in https://github.com/sissbruecker/linkding/pull/1087
* @benjaminoakes made their first contribution in https://github.com/sissbruecker/linkding/pull/1079
* @proog made their first contribution in https://github.com/sissbruecker/linkding/pull/1146
* @pvl made their first contribution in https://github.com/sissbruecker/linkding/pull/1125
* @Tql-ws1 made their first contribution in https://github.com/sissbruecker/linkding/pull/1132

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.41.0...v1.42.0

---

## v1.41.0 (19/06/2025)

### What's Changed
* Add bundles for organizing bookmarks by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1097
* Add REST API for bookmark bundles by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1100
* Add date filters for REST API by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1080
* Fix side panel not being hidden on smaller viewports by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1089
* Fix assets not using correct icon by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1098
* Add LinkBuddy to community section by @peterto in https://github.com/sissbruecker/linkding/pull/1088
* Bump tar-fs in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1084
* Bump django from 5.1.9 to 5.1.10 by @dependabot in https://github.com/sissbruecker/linkding/pull/1086
* Bump requests from 2.32.3 to 2.32.4 by @dependabot in https://github.com/sissbruecker/linkding/pull/1090
* Bump urllib3 from 2.2.3 to 2.5.0 by @dependabot in https://github.com/sissbruecker/linkding/pull/1096

### New Contributors
* @peterto made their first contribution in https://github.com/sissbruecker/linkding/pull/1088

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.40.0...v1.41.0

---

## v1.40.0 (17/05/2025)

### What's Changed
* Add bulk and single bookmark metadata refresh by @Teknicallity in https://github.com/sissbruecker/linkding/pull/999
* Prefer local snapshot over web archive link in bookmark list links by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1021
* Push Docker images to GHCR in addition to Docker Hub by @caycehouse in https://github.com/sissbruecker/linkding/pull/1024
* Allow auto tagging rules to match URL fragments by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1045
* Linkify plain URLs in notes by @sonicdoe in https://github.com/sissbruecker/linkding/pull/1051
* Add opensearch declaration by @jzorn in https://github.com/sissbruecker/linkding/pull/1058
* Allow pre-filling tags in new bookmark form by @dasrecht in https://github.com/sissbruecker/linkding/pull/1060
* Handle lowercase "true" in environment variables by @jose-elias-alvarez in https://github.com/sissbruecker/linkding/pull/1020
* Accessibility improvements in page structure by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1014
* Improve announcements after navigation by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1015
* Fix OIDC login link by @cite in https://github.com/sissbruecker/linkding/pull/1019
* Fix bookmark asset download endpoint by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1033
* Add docs for auto tagging by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1009
* Fix typo in index.mdx tagline by @cenviity in https://github.com/sissbruecker/linkding/pull/1052
* Add how-to for using linkding PWA in native Android share sheet by @kzshantonu in https://github.com/sissbruecker/linkding/pull/1055
* Adding linktiles to community projects by @haondt in https://github.com/sissbruecker/linkding/pull/1025
* Bump django from 5.1.5 to 5.1.7 by @dependabot in https://github.com/sissbruecker/linkding/pull/1007
* Bump django from 5.1.7 to 5.1.8 by @dependabot in https://github.com/sissbruecker/linkding/pull/1030
* Bump tar-fs in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1028
* Bump prismjs from 1.29.0 to 1.30.0 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1034
* Bump @babel/helpers from 7.26.7 to 7.27.0 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1035
* Bump vite from 5.4.14 to 5.4.17 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1036
* Bump esbuild, @astrojs/starlight and astro in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/1037
* Bump django from 5.1.8 to 5.1.9 by @dependabot in https://github.com/sissbruecker/linkding/pull/1059

### New Contributors
* @cite made their first contribution in https://github.com/sissbruecker/linkding/pull/1019
* @jose-elias-alvarez made their first contribution in https://github.com/sissbruecker/linkding/pull/1020
* @Teknicallity made their first contribution in https://github.com/sissbruecker/linkding/pull/999
* @haondt made their first contribution in https://github.com/sissbruecker/linkding/pull/1025
* @caycehouse made their first contribution in https://github.com/sissbruecker/linkding/pull/1024
* @cenviity made their first contribution in https://github.com/sissbruecker/linkding/pull/1052
* @sonicdoe made their first contribution in https://github.com/sissbruecker/linkding/pull/1051
* @jzorn made their first contribution in https://github.com/sissbruecker/linkding/pull/1058
* @dasrecht made their first contribution in https://github.com/sissbruecker/linkding/pull/1060

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.39.1...v1.40.0

---

## v1.39.1 (06/03/2025)

> [!WARNING]
> Due to changes in the release process the `1.39.0` Docker image accidentally runs the application in debug mode. Please upgrade to `1.39.1` instead.

---

## v1.39.0 (06/03/2025)

### What's Changed
* Add REST endpoint for uploading snapshots from the Singlefile extension by @sissbruecker in https://github.com/sissbruecker/linkding/pull/996
* Add bookmark assets API by @sissbruecker in https://github.com/sissbruecker/linkding/pull/1003
* Allow providing REST API authentication token with Bearer keyword by @sissbruecker in https://github.com/sissbruecker/linkding/pull/995
* Add Telegram bot to community section by @marb08 in https://github.com/sissbruecker/linkding/pull/1001
* Adding linklater to community projects by @nsartor in https://github.com/sissbruecker/linkding/pull/1002

### New Contributors
* @marb08 made their first contribution in https://github.com/sissbruecker/linkding/pull/1001
* @nsartor made their first contribution in https://github.com/sissbruecker/linkding/pull/1002

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.38.1...v1.39.0

---

## v1.38.1 (22/02/2025)

### What's Changed
* Remove preview image when bookmark is deleted by @sissbruecker in https://github.com/sissbruecker/linkding/pull/989
* Try limit uwsgi memory usage by configuring file descriptor limit by @sissbruecker in https://github.com/sissbruecker/linkding/pull/990
* Add note about OIDC and LD_SUPERUSER_NAME combination by @tebriel in https://github.com/sissbruecker/linkding/pull/992
* Return web archive fallback URL from REST API by @sissbruecker in https://github.com/sissbruecker/linkding/pull/993
* Fix auth proxy logout by @sissbruecker in https://github.com/sissbruecker/linkding/pull/994

### New Contributors
* @tebriel made their first contribution in https://github.com/sissbruecker/linkding/pull/992

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.38.0...v1.38.1

---

## v1.38.0 (09/02/2025)

### What's Changed
* Fix nav menu closing on mousedown in Safari by @sissbruecker in https://github.com/sissbruecker/linkding/pull/965
* Allow customizing username when creating user through OIDC by @kyuuk in https://github.com/sissbruecker/linkding/pull/971
* Improve accessibility of modal dialogs by @sissbruecker in https://github.com/sissbruecker/linkding/pull/974
* Add option to collapse side panel by @sissbruecker in https://github.com/sissbruecker/linkding/pull/975
* Convert tag modal into drawer by @sissbruecker in https://github.com/sissbruecker/linkding/pull/977
* Add RSS link to shared bookmarks page by @sissbruecker in https://github.com/sissbruecker/linkding/pull/984
* Add Additional iOS Shortcut to community section by @joshdick in https://github.com/sissbruecker/linkding/pull/968

### New Contributors
* @kyuuk made their first contribution in https://github.com/sissbruecker/linkding/pull/971

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.37.0...v1.38.0

---

## v1.37.0 (26/01/2025)

### What's Changed
* Add option to disable request logs by @dmarcoux in https://github.com/sissbruecker/linkding/pull/887
* Add default robots.txt to block crawlers by @sissbruecker in https://github.com/sissbruecker/linkding/pull/959
* Fix menu dropdown focus traps by @sissbruecker in https://github.com/sissbruecker/linkding/pull/944
* Provide accessible name to radio groups by @sissbruecker in https://github.com/sissbruecker/linkding/pull/945
* Add serchding to community projects, sort the list by alphabetical order by @ldwgchen in https://github.com/sissbruecker/linkding/pull/880
* Add cosmicding To Community Resources by @vkhitrin in https://github.com/sissbruecker/linkding/pull/892
* Add 3 new community projects by @sebw in https://github.com/sissbruecker/linkding/pull/949
* Add a rust client library to community.md by @zbrox in https://github.com/sissbruecker/linkding/pull/914
* Update community.md by @justusthane in https://github.com/sissbruecker/linkding/pull/897
* Bump astro from 4.15.8 to 4.16.3 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/884
* Bump vite from 5.4.9 to 5.4.14 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/953
* Bump django from 5.1.1 to 5.1.5 by @dependabot in https://github.com/sissbruecker/linkding/pull/947
* Bump nanoid from 3.3.7 to 3.3.8 by @dependabot in https://github.com/sissbruecker/linkding/pull/928
* Bump astro from 4.16.3 to 4.16.18 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/929
* Bump nanoid from 3.3.7 to 3.3.8 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/962

### New Contributors
* @ldwgchen made their first contribution in https://github.com/sissbruecker/linkding/pull/880
* @dmarcoux made their first contribution in https://github.com/sissbruecker/linkding/pull/887
* @vkhitrin made their first contribution in https://github.com/sissbruecker/linkding/pull/892
* @sebw made their first contribution in https://github.com/sissbruecker/linkding/pull/949
* @justusthane made their first contribution in https://github.com/sissbruecker/linkding/pull/897

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.36.0...v1.37.0

---

## v1.36.0 (02/10/2024)

### What's Changed
* Replace uBlock Origin with uBlock Origin Lite by @sissbruecker in https://github.com/sissbruecker/linkding/pull/866
* Add LAST_MODIFIED attribute when exporting by @ixzhao in https://github.com/sissbruecker/linkding/pull/860
* Return client error status code for invalid form submissions by @sissbruecker in https://github.com/sissbruecker/linkding/pull/849
* Fix header.svg text by @vladh in https://github.com/sissbruecker/linkding/pull/850
* Do not clear fields in POST requests (API behavior change) by @sissbruecker in https://github.com/sissbruecker/linkding/pull/852
* Prevent duplicates when editing by @sissbruecker in https://github.com/sissbruecker/linkding/pull/853
* Fix jumping details modal on back navigation by @sissbruecker in https://github.com/sissbruecker/linkding/pull/854
* Fix select dropdown menu background in dark theme by @sissbruecker in https://github.com/sissbruecker/linkding/pull/858
* Do not escape valid characters in custom CSS by @sissbruecker in https://github.com/sissbruecker/linkding/pull/863
* Simplify Docker build by @sissbruecker in https://github.com/sissbruecker/linkding/pull/865
* Improve error handling for auto tagging by @sissbruecker in https://github.com/sissbruecker/linkding/pull/855
* Bump rollup from 4.13.0 to 4.22.4 by @dependabot in https://github.com/sissbruecker/linkding/pull/851
* Bump rollup from 4.21.3 to 4.22.4 in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/856

### New Contributors
* @vladh made their first contribution in https://github.com/sissbruecker/linkding/pull/850
* @ixzhao made their first contribution in https://github.com/sissbruecker/linkding/pull/860

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.35.0...v1.36.0

---

## v1.35.0 (23/09/2024)

### What's Changed
* Add configuration options for pagination by @sissbruecker in https://github.com/sissbruecker/linkding/pull/835
* Show placeholder if there is no preview image by @sissbruecker in https://github.com/sissbruecker/linkding/pull/842
* Allow bookmarks to have empty title and description by @sissbruecker in https://github.com/sissbruecker/linkding/pull/843
* Add clear buttons in bookmark form by @sissbruecker in https://github.com/sissbruecker/linkding/pull/846
* Add basic fail2ban support by @sissbruecker in https://github.com/sissbruecker/linkding/pull/847
* Add documentation website by @sissbruecker in https://github.com/sissbruecker/linkding/pull/833
* Add go-linkding to community projects by @piero-vic in https://github.com/sissbruecker/linkding/pull/836
* Fix a broken link to options documentation by @zbrox in https://github.com/sissbruecker/linkding/pull/844
* Use HTTPS repository link for devcontainer by @voltagex in https://github.com/sissbruecker/linkding/pull/837
* Bump requests version to 3.23.3 by @voltagex in https://github.com/sissbruecker/linkding/pull/839
* Bump path-to-regexp and astro in /docs by @dependabot in https://github.com/sissbruecker/linkding/pull/840
* Bump dependencies by @sissbruecker in https://github.com/sissbruecker/linkding/pull/841

### New Contributors
* @piero-vic made their first contribution in https://github.com/sissbruecker/linkding/pull/836
* @voltagex made their first contribution in https://github.com/sissbruecker/linkding/pull/839
* @zbrox made their first contribution in https://github.com/sissbruecker/linkding/pull/844

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.34.0...v1.35.0

---

## v1.34.0 (16/09/2024)

### What's Changed
* Fix several issues around browser back navigation by @sissbruecker in https://github.com/sissbruecker/linkding/pull/825
* Speed up response times for certain actions by @sissbruecker in https://github.com/sissbruecker/linkding/pull/829
* Implement IPv6 capability by @itz-Jana in https://github.com/sissbruecker/linkding/pull/826

### New Contributors
* @itz-Jana made their first contribution in https://github.com/sissbruecker/linkding/pull/826

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.33.0...v1.34.0

---

## v1.33.0 (14/09/2024)

### What's Changed
* Theme improvements by @sissbruecker in https://github.com/sissbruecker/linkding/pull/822
* Speed up navigation by @sissbruecker in https://github.com/sissbruecker/linkding/pull/824
* Rename "SingeFileError" to "SingleFileError" by @curiousleo in https://github.com/sissbruecker/linkding/pull/823
* Bump svelte from 4.2.12 to 4.2.19 by @dependabot in https://github.com/sissbruecker/linkding/pull/806

### New Contributors
* @curiousleo made their first contribution in https://github.com/sissbruecker/linkding/pull/823

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.32.0...v1.33.0

---

## v1.32.0 (10/09/2024)

### What's Changed
* Allow configuring landing page for unauthenticated users by @sissbruecker in https://github.com/sissbruecker/linkding/pull/808
* Allow configuring guest user profile by @sissbruecker in https://github.com/sissbruecker/linkding/pull/809
* Return bookmark tags in RSS feeds by @sissbruecker in https://github.com/sissbruecker/linkding/pull/810
* Additional filter parameters for RSS feeds by @sissbruecker in https://github.com/sissbruecker/linkding/pull/811
* Allow pre-filling notes in new bookmark form by @sissbruecker in https://github.com/sissbruecker/linkding/pull/812
* Fix inconsistent tag order in bookmarks by @sissbruecker in https://github.com/sissbruecker/linkding/pull/819
* Fix auto-tagging when URL includes port by @sissbruecker in https://github.com/sissbruecker/linkding/pull/820


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.31.1...v1.32.0

---

## v1.31.1 (30/08/2024)

### What's Changed
* Include favicons and thumbnails in REST API by @sissbruecker in https://github.com/sissbruecker/linkding/pull/763
* Add Pinkt to the Community section by @fibelatti in https://github.com/sissbruecker/linkding/pull/772
* removed version line from docker compose yaml by @volumedata21 in https://github.com/sissbruecker/linkding/pull/800
* Add resource linkding logo by @QYG2297248353 in https://github.com/sissbruecker/linkding/pull/788
* Allow use of standard docker `TZ` env var by @watsonbox in https://github.com/sissbruecker/linkding/pull/765
* Add OCI source annotation to link back to source repo by @Ramblurr in https://github.com/sissbruecker/linkding/pull/701
* Generate fallback URLs for web archive links by @sissbruecker in https://github.com/sissbruecker/linkding/pull/804
* Fix overflow in settings page by @sissbruecker in https://github.com/sissbruecker/linkding/pull/805
* Bump django from 5.0.3 to 5.0.8 by @dependabot in https://github.com/sissbruecker/linkding/pull/795
* Bump certifi from 2023.11.17 to 2024.7.4 by @dependabot in https://github.com/sissbruecker/linkding/pull/775
* Bump djangorestframework from 3.14.0 to 3.15.2 by @dependabot in https://github.com/sissbruecker/linkding/pull/769
* Bump urllib3 from 2.1.0 to 2.2.2 by @dependabot in https://github.com/sissbruecker/linkding/pull/762

### New Contributors
* @fibelatti made their first contribution in https://github.com/sissbruecker/linkding/pull/772
* @volumedata21 made their first contribution in https://github.com/sissbruecker/linkding/pull/800
* @QYG2297248353 made their first contribution in https://github.com/sissbruecker/linkding/pull/788
* @watsonbox made their first contribution in https://github.com/sissbruecker/linkding/pull/765
* @Ramblurr made their first contribution in https://github.com/sissbruecker/linkding/pull/701

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.31.0...v1.31.1

---

## v1.31.0 (16/06/2024)

### What's Changed
* Add support for bookmark thumbnails by @vslinko in https://github.com/sissbruecker/linkding/pull/721
* Automatically add tags to bookmarks based on URL pattern by @vslinko in https://github.com/sissbruecker/linkding/pull/736
* Load bookmark thumbnails after import by @vslinko in https://github.com/sissbruecker/linkding/pull/724
* Load missing thumbnails after enabling the feature by @sissbruecker in https://github.com/sissbruecker/linkding/pull/725
* Thumbnails lazy loading by @vslinko in https://github.com/sissbruecker/linkding/pull/734
* Add option for disabling tag grouping by @vslinko in https://github.com/sissbruecker/linkding/pull/735
* Preview auto tags in bookmark form by @sissbruecker in https://github.com/sissbruecker/linkding/pull/737
* Hide tooltip on mobile by @vslinko in https://github.com/sissbruecker/linkding/pull/733
* Bump requests from 2.31.0 to 2.32.0 by @dependabot in https://github.com/sissbruecker/linkding/pull/740

### New Contributors
* @vslinko made their first contribution in https://github.com/sissbruecker/linkding/pull/721

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.30.0...v1.31.0

---

## v1.30.0 (20/04/2024)

### What's Changed
* Add reader mode by @sissbruecker in https://github.com/sissbruecker/linkding/pull/703
* Allow uploading custom files for bookmarks by @sissbruecker in https://github.com/sissbruecker/linkding/pull/713
* Add option for marking bookmarks as unread by default by @ab623 in https://github.com/sissbruecker/linkding/pull/706
* Make blocking cookie banners more reliable by @sissbruecker in https://github.com/sissbruecker/linkding/pull/699
* Close bookmark details with escape by @sissbruecker in https://github.com/sissbruecker/linkding/pull/702
* Show proper name for bookmark assets in admin by @ab623 in https://github.com/sissbruecker/linkding/pull/708
* Bump sqlparse from 0.4.4 to 0.5.0 by @dependabot in https://github.com/sissbruecker/linkding/pull/704

### New Contributors
* @ab623 made their first contribution in https://github.com/sissbruecker/linkding/pull/706

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.29.0...v1.30.0

---

## v1.29.0 (14/04/2024)

### What's Changed
* Remove ads and cookie banners from HTML snapshots by @sissbruecker in https://github.com/sissbruecker/linkding/pull/695
* Add button for creating missing HTML snapshots by @sissbruecker in https://github.com/sissbruecker/linkding/pull/696
* Refresh file list when there are queued snapshots by @sissbruecker in https://github.com/sissbruecker/linkding/pull/697
* Bump idna from 3.6 to 3.7 by @dependabot in https://github.com/sissbruecker/linkding/pull/694


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.28.0...v1.29.0

---

## v1.28.0 (09/04/2024)

### What's Changed
* Add option to disable SSL verification for OIDC by @akaSyntaax in https://github.com/sissbruecker/linkding/pull/684
* Add full backup method by @sissbruecker in https://github.com/sissbruecker/linkding/pull/686
* Truncate snapshot filename for long URLs by @sissbruecker in https://github.com/sissbruecker/linkding/pull/687
* Add option for customizing single-file timeout by @pettijohn in https://github.com/sissbruecker/linkding/pull/688
* Add option for passing arguments to single-file command by @pettijohn in https://github.com/sissbruecker/linkding/pull/691
* Fix typo by @tianheg in https://github.com/sissbruecker/linkding/pull/689

### New Contributors
* @akaSyntaax made their first contribution in https://github.com/sissbruecker/linkding/pull/684
* @pettijohn made their first contribution in https://github.com/sissbruecker/linkding/pull/688

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.27.1...v1.28.0

---

## v1.27.1 (07/04/2024)

### What's Changed
* Fix HTML snapshot errors related to single-file-cli by @sissbruecker in https://github.com/sissbruecker/linkding/pull/683
* Replace django-background-tasks with huey by @sissbruecker in https://github.com/sissbruecker/linkding/pull/657
* Add Authelia OIDC example to docs by @hugo-vrijswijk in https://github.com/sissbruecker/linkding/pull/675


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.27.0...v1.27.1

---

## v1.27.0 (01/04/2024)

### What's Changed
* Archive snapshots of websites locally by @sissbruecker in https://github.com/sissbruecker/linkding/pull/672
* Add Railway hosting option by @tianheg in https://github.com/sissbruecker/linkding/pull/661
* Add how to for increasing the font size by @sissbruecker in https://github.com/sissbruecker/linkding/pull/667

### New Contributors
* @tianheg made their first contribution in https://github.com/sissbruecker/linkding/pull/661

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.26.0...v1.27.0

---

## v1.26.0 (30/03/2024)

### What's Changed
* Add option for showing bookmark description as separate block by @sissbruecker in https://github.com/sissbruecker/linkding/pull/663
* Add bookmark details view by @sissbruecker in https://github.com/sissbruecker/linkding/pull/665
* Make bookmark list actions configurable by @sissbruecker in https://github.com/sissbruecker/linkding/pull/666
* Bump black from 24.1.1 to 24.3.0 by @dependabot in https://github.com/sissbruecker/linkding/pull/662


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.25.0...v1.26.0

---

## v1.25.0 (18/03/2024)

### What's Changed
* Improve PWA capabilities by @hugo-vrijswijk in https://github.com/sissbruecker/linkding/pull/630
* build improvements by @hugo-vrijswijk in https://github.com/sissbruecker/linkding/pull/649
* Add support for oidc by @Nighmared in https://github.com/sissbruecker/linkding/pull/389
* Add option for custom CSS by @sissbruecker in https://github.com/sissbruecker/linkding/pull/652
* Update backup location to safe directory by @bphenriques in https://github.com/sissbruecker/linkding/pull/653
* Include web archive link in /api/bookmarks/ by @sissbruecker in https://github.com/sissbruecker/linkding/pull/655
* Add RSS feeds for shared bookmarks by @sissbruecker in https://github.com/sissbruecker/linkding/pull/656
* Bump django from 5.0.2 to 5.0.3 by @dependabot in https://github.com/sissbruecker/linkding/pull/658

### New Contributors
* @hugo-vrijswijk made their first contribution in https://github.com/sissbruecker/linkding/pull/630
* @Nighmared made their first contribution in https://github.com/sissbruecker/linkding/pull/389
* @bphenriques made their first contribution in https://github.com/sissbruecker/linkding/pull/653

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.24.2...v1.25.0

---

## v1.24.2 (16/03/2024)

### What's Changed
* Fix logout button by @sissbruecker in https://github.com/sissbruecker/linkding/pull/648


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.24.1...v1.24.2

---

## v1.24.1 (16/03/2024)

### What's Changed
* Bump dependencies by @sissbruecker in https://github.com/sissbruecker/linkding/pull/618
* Persist secret key in data folder by @sissbruecker in https://github.com/sissbruecker/linkding/pull/620
* Group ideographic characters in tag cloud by @jonathan-s in https://github.com/sissbruecker/linkding/pull/613
* Bump django from 5.0.1 to 5.0.2 by @dependabot in https://github.com/sissbruecker/linkding/pull/625
* Add k8s setup to community section by @jzck in https://github.com/sissbruecker/linkding/pull/633
* Added a new Linkding client to community section by @JGeek00 in https://github.com/sissbruecker/linkding/pull/638

### New Contributors
* @jzck made their first contribution in https://github.com/sissbruecker/linkding/pull/633
* @JGeek00 made their first contribution in https://github.com/sissbruecker/linkding/pull/638

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.24.0...v1.24.1

---

## v1.24.0 (27/01/2024)

### What's Changed
* Support Open Graph description by @jonathan-s in https://github.com/sissbruecker/linkding/pull/602
* Add tooltip to truncated bookmark titles by @jonathan-s in https://github.com/sissbruecker/linkding/pull/607
* Improve bulk tag performance by @sissbruecker in https://github.com/sissbruecker/linkding/pull/612
* Increase tag limit in tag autocomplete by @hypebeast in https://github.com/sissbruecker/linkding/pull/581
* Add CapRover as managed hosting option by @adamshand in https://github.com/sissbruecker/linkding/pull/585
* Bump playwright dependencies by @jonathan-s in https://github.com/sissbruecker/linkding/pull/601
* Adjust archive.org donation link in general.html by @JnsDornbusch in https://github.com/sissbruecker/linkding/pull/603

### New Contributors
* @hypebeast made their first contribution in https://github.com/sissbruecker/linkding/pull/581
* @adamshand made their first contribution in https://github.com/sissbruecker/linkding/pull/585
* @jonathan-s made their first contribution in https://github.com/sissbruecker/linkding/pull/601
* @JnsDornbusch made their first contribution in https://github.com/sissbruecker/linkding/pull/603

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.23.1...v1.24.0

---

## v1.23.1 (08/12/2023)

### What's Changed
* Properly encode search query param by @sissbruecker in https://github.com/sissbruecker/linkding/pull/587

> [!WARNING] 
> *This resolves a security vulnerability in linkding. Everyone is encouraged to upgrade to the latest version as soon as possible.*

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.23.0...v1.23.1

---

## v1.23.0 (24/11/2023)

### What's Changed
* Add Alpine based Docker image (experimental) by @sissbruecker in https://github.com/sissbruecker/linkding/pull/570
* Add backup CLI command by @sissbruecker in https://github.com/sissbruecker/linkding/pull/571
* Update browser extension links by @OPerepadia in https://github.com/sissbruecker/linkding/pull/574
* Include archived bookmarks in export by @sissbruecker in https://github.com/sissbruecker/linkding/pull/579

### New Contributors
* @OPerepadia made their first contribution in https://github.com/sissbruecker/linkding/pull/574

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.22.3...v1.23.0

---

## v1.22.3 (04/11/2023)

### What's Changed
* Fix RSS feed not handling None values  by @vitormarcal in https://github.com/sissbruecker/linkding/pull/569
* Bump django from 4.1.10 to 4.1.13 by @dependabot in https://github.com/sissbruecker/linkding/pull/567

### New Contributors
* @vitormarcal made their first contribution in https://github.com/sissbruecker/linkding/pull/569

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.22.2...v1.22.3

---

## v1.22.2 (27/10/2023)

### What's Changed
* Fix search options not opening on iOS by @sissbruecker in https://github.com/sissbruecker/linkding/pull/549
* Bump urllib3 from 1.26.11 to 1.26.17 by @dependabot in https://github.com/sissbruecker/linkding/pull/542
* Add iOS shortcut to community section by @andrewdolphin in https://github.com/sissbruecker/linkding/pull/550
* Disable editing of search preferences in user admin by @sissbruecker in https://github.com/sissbruecker/linkding/pull/555
* Add feed2linkding to community section by @Strubbl in https://github.com/sissbruecker/linkding/pull/544
* Sanitize RSS feed to remove control characters by @sissbruecker in https://github.com/sissbruecker/linkding/pull/565
* Bump urllib3 from 1.26.17 to 1.26.18 by @dependabot in https://github.com/sissbruecker/linkding/pull/560

### New Contributors
* @andrewdolphin made their first contribution in https://github.com/sissbruecker/linkding/pull/550
* @Strubbl made their first contribution in https://github.com/sissbruecker/linkding/pull/544

**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.22.1...v1.22.2

---

## v1.22.1 (06/10/2023)

### What's Changed
* Fix memory leak with SQLite by @sissbruecker in https://github.com/sissbruecker/linkding/pull/548


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.22.0...v1.22.1

---

## v1.22.0 (01/10/2023)

### What's Changed
* Fix case-insensitive search for unicode characters in SQLite by @sissbruecker in https://github.com/sissbruecker/linkding/pull/520
* Add sort option to bookmark list by @sissbruecker in https://github.com/sissbruecker/linkding/pull/522
* Add button to show tags on smaller screens by @sissbruecker in https://github.com/sissbruecker/linkding/pull/529
* Make code blocks in notes scrollable by @sissbruecker in https://github.com/sissbruecker/linkding/pull/530
* Add filter for shared state by @sissbruecker in https://github.com/sissbruecker/linkding/pull/531
* Add support for exporting/importing bookmark notes by @sissbruecker in https://github.com/sissbruecker/linkding/pull/532
* Add filter for unread state by @sissbruecker in https://github.com/sissbruecker/linkding/pull/535
* Allow saving search preferences by @sissbruecker in https://github.com/sissbruecker/linkding/pull/540
* Add user profile endpoint by @sissbruecker in https://github.com/sissbruecker/linkding/pull/541


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.21.0...v1.22.0

---

## v1.21.1 (26/09/2023)

### What's Changed
* Fix bulk edit to respect searched tags by @sissbruecker in https://github.com/sissbruecker/linkding/pull/537


**Full Changelog**: https://github.com/sissbruecker/linkding/compare/v1.21.0...v1.21.1

---
