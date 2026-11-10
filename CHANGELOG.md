# 变更日志（CHANGELOG）

本项目采用 [Keep a Changelog](https://keepachangelog.com/zh-CN/) 风格记录版本迭代。
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [v0.2.0] - 2026-11-10

### 变更（Breaking）
- **废弃 Hugo + PaperMod 静态博客架构，切换到 XHBlogs**（Next.js 毛玻璃风格博客 + 本地后台控制台）。
- 参考项目：[XinghuisamaBlogs v0.4.4](https://github.com/heiehiehi/XinghuisamaBlogs)（CC BY-NC 4.0，个人非商用）。

### 新增
- 本地后台控制台：Markdown 编辑器、草稿管理、图床配置、壁纸分组、搜索等。
- 官方仓库已克隆至 `XinghuisamaBlogs/`，前端与控制台 npm 依赖、Python 依赖均已安装。
- 控制台 `blogPath` 已预配置指向本机 `XinghuisamaBlogs/XHBlogs`。
- 博客前端与控制台均已本地验证通过（页面渲染正常、零报错）。

### 移除
- Hugo 相关文件（hugo.toml、content/、themes/、build.ps1、start.bat、public/ 等）已移至 `.temp/hugo-removed/` 暂存，确认不再需要后可整体删除。
- 旧版完整代码仍保留在 git 历史 tag `v0.1.0`，可随时回退。

### 说明
- XHBlogs 官方定位为 GitHub + Vercel 公网部署；本项目仅使用其**本地部分**（控制台写作 + 本地预览），不配置远程推送。
- XHBlogs 代码由官方仓库自身 git 管理，更新用官方 `update.bat`。

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