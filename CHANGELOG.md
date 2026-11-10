# 变更日志（CHANGELOG）

本项目采用 [Keep a Changelog](https://keepachangelog.com/zh-CN/) 风格记录版本迭代。
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [v0.3.0] - 2026-11-10

### 变更（Revert）
- **回退到 Hugo + PaperMod 技术路线**，删除 XHBlogs 项目（v0.2.0 试用后放弃）。
- XHBlogs 已从本机删除（官方仓库可随时重新获取：https://github.com/heiehiehi/XinghuisamaBlogs ）。

### 恢复
- Hugo 全部文件从 git tag `v0.1.0` 恢复：hugo.toml、content/、themes/、build.ps1、start.bat、static/ 等。
- `public/` 构建产物从暂存区移回，`hugo.exe` 工具一直保留在 `C:\Users\Administrator\tools\hugo`，无需重装。
- 恢复后重新构建验证通过（20 页，正常）。

### 说明
- 本地预览：双击 `start.bat`，或命令行 `hugo server`，浏览器访问 http://localhost:1313。
- 旧 XHBlogs 方案期间未产生任何文章内容，无需数据迁移。

## [v0.1.0] - 2026-11-10

### 新增
- 基于 Hugo（v0.169.0）搭建个人博客，纯本地运行，不依赖任何远程托管平台。
- 采用 PaperMod 主题：白底简约、支持文章列表 / 标签 / 归档。
- 本地 git 仓库管理版本（仅本机，不推送远程）。
- 示例文章：《欢迎来到我的博客》《本地博客使用说明》，及「关于」页。
- `start.bat`：一键启动本地预览服务并打开浏览器。
- `build.ps1`：构建脚本，生成静态站点并做链接相对化处理。
- 站点图标：favicon.ico / favicon-16x16.png / favicon-32x32.png。
- 项目说明：`README.md`。

### 已知限制
- 直接双击 `public/index.html`（file://）：首页可正常浏览，子页面部分导航链接会错位（PaperMod 主题对 file:// 协议的固有限制）。
- 完整预览请使用 `start.bat` 或 `hugo server`。

### 说明
- 本地预览：双击 `start.bat`，或命令行 `hugo server`，浏览器访问 http://localhost:1313。
- 静态产物：`public/`（已被 gitignore），由 `build.ps1` 生成，可供将来发布使用。