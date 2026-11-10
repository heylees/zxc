---
title: "本地博客使用说明"
date: 2026-11-10T00:00:00+08:00
tags: ["指南"]
draft: false
---

本博客为 **Hugo** 构建的纯本地站点。以下是常用操作。

## 写文章

在 `content/posts/` 目录新建 `.md` 文件，文件头部写元信息：

```toml
---
title: "文章标题"
date: 2026-11-10T00:00:00+08:00
tags: ["标签"]
draft: false
---
```

下方用 Markdown 写正文。

## 本地预览

```bash
hugo server -D
```

浏览器打开 http://localhost:1313 即可实时预览（`-D` 会显示草稿）。

## 生成静态页面

```bash
hugo
```

产物输出到 `public/` 目录，双击 `public/index.html` 也能直接查看。

## 版本管理

项目用本地 git 管理版本（不推送任何远程）：

```bash
git add .
git commit -m "v0.1.0 初版"
git tag v0.1.0
```

每次改动记录在根目录 `CHANGELOG.md`。