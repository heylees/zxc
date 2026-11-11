# zxc

基于 Hugo + PaperMod 的个人写作空间。纯静态站点，通过 GitHub Actions 发布到 GitHub Pages。

## 本地预览

```bash
hugo server -D
```

打开 http://localhost:1313/ 。`-D` 显示草稿，改文件会自动刷新，`Ctrl+C` 停止。

## 发布

推送 `main` 分支后，`.github/workflows/hugo.yaml` 会自动构建并发布。首次部署需在仓库 **Settings → Pages** 把 Source 设为 **GitHub Actions**。

## 写点什么

文章放在 `content/posts/`，Markdown 格式；`hugo new posts/标题.md` 可套用 `archetypes/` 里的模板。

## 目录

| 路径 | 作用 |
|---|---|
| `content/` | 文章与页面 |
| `layouts/` | 模板覆盖 |
| `assets/css/extended/` | 站点样式 |
| `static/` | 图片、图标、音乐 |
| `themes/PaperMod/` | 主题 |
| `.github/workflows/` | 自动构建发布 |
