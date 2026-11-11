---
title: "使用小贴士"
date: 2026-11-10T00:00:00+08:00
summary: "怎么写、怎么预览、怎么发布，以及版本记录放在哪里。"
types: ["随笔"]
tags: ["使用说明"]
draft: true

# 隐藏：源码保留在 content/，但任何构建都不生成页面、也不进入列表
build:
  list: never
  render: never
  publishResources: false
---

这个小站是一份静态页面：文字写在本地，推送到 GitHub 后由 Actions 自动构建并发布。想写点什么、想预览，看下面几步就够了。

## 写点什么

在 `content/posts/` 目录新建 `.md` 文件，文件头部写元信息：

```yaml
---
title: "文章标题"
date: 2026-11-10T00:00:00+08:00
summary: "一句话摘要"
types: ["日记"]   # 日记 / 随笔 / 读后感 / 读书笔记
tags: ["标签"]
draft: false
---
```

下方用 Markdown 写正文。也可以用现成的模板，例如 `hugo new -k diary posts/今天.md`。

## 本地预览（可选）

本机装了 Hugo 的话：

```bash
hugo server -D
```

浏览器打开 http://localhost:1313 就能实时预览（`-D` 会显示草稿）。不装 Hugo 也不影响发布，推送后直接看线上效果即可。

## 发布

```bash
git add .
git commit -m "写一篇新的"
git push origin main
```

推送后 GitHub Actions 会自动构建静态页面并发布到 Pages，通常一两分钟就能看到。`public/` 是本地构建产物，不入库。

## 版本管理

项目用 git 管理版本，每次改动记录在根目录 `CHANGELOG.md`：

```bash
git tag v0.4.5
git push origin main --tags
```
