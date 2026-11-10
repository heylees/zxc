# 我的博客（Hugo 纯本地）

一个基于 **Hugo** 搭建的**纯本地**个人博客。不依赖任何远程托管平台，代码用本地 git 管理，数据与代码都在本项目目录内。

## 快速开始

### 方式一：双击即用（推荐）
双击 **`start.bat`**，会自动启动本地预览服务并打开浏览器 `http://localhost:1313/`。
纯本地运行，不联网、不上传任何数据。

### 方式二：命令行预览
```powershell
hugo server -D
```
浏览器访问 http://localhost:1313/（`-D` 显示草稿）。

### 停止预览
关闭启动预览的终端窗口，或在任务管理器结束 `hugo.exe`。

## 写文章

在 `content/posts/` 下新建 `.md` 文件：

```toml
---
title: "文章标题"
date: 2026-11-10T00:00:00+08:00
tags: ["标签"]
draft: false
---
正文用 Markdown 编写。
```

保存后在预览页刷新即可看到（Hugo 支持热更新）。

## 生成静态站点（发布/离线用）

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

产物输出到 `public/`（相对路径，`public/index.html` 可双击离线浏览；完整导航与离线预览仍建议用 `start.bat`）。

## 版本管理

项目用**本地 git** 管理（仅本机，不推送任何远程）：

```bash
git add .
git commit -m "描述"
git tag v0.1.0
```

每次迭代记录在 `CHANGELOG.md`。

## 目录结构

```
newproject/
├── hugo.toml           # 站点配置（标题、主题、菜单）
├── content/
│   ├── posts/          # 博客文章（Markdown）
│   └── about.md
├── themes/PaperMod/    # 主题
├── static/             # 静态资源（favicon 等）
├── public/             # 构建产物（gitignore）
├── build.ps1           # 构建脚本
├── start.bat           # 一键本地预览启动器
└── CHANGELOG.md        # 版本迭代记录
```

## 环境要求

- Windows + [Hugo](https://gohugo.io/)（本项目使用 v0.169.0，位于 `C:\Users\Administrator\tools\hugo`）
- 无需 Python、无需服务器、无需任何远程账号。