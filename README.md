# 我的博客（XHBlogs）

基于开源项目 [XinghuisamaBlogs（XHBlogs）](https://github.com/heiehiehi/XinghuisamaBlogs) 搭建的个人博客：**Next.js 毛玻璃风格前端 + Python 本地后台控制台**。

## 快速开始

1. **启动控制台**：双击 `XinghuisamaBlogs\my-blog-manager\Start.bat`，弹出「星辉云端·控制台」窗口
2. **写文章**：控制台内用 Markdown 编辑器写作，支持草稿、图床、壁纸等
3. **同步内容**：点「同步 Blog」将内容写入前端源码目录
4. **浏览博客**：在 `XinghuisamaBlogs\XHBlogs` 目录执行 `npm run dev`，浏览器访问 http://localhost:3000

## 目录结构

```
newproject/
├── XinghuisamaBlogs/            # XHBlogs 官方仓库（自带 git）
│   ├── XHBlogs/                 # 博客前端（Next.js）
│   └── my-blog-manager/         # 本地后台控制台（Python + Next.js）
├── CHANGELOG.md                 # 版本迭代记录
└── README.md
```

## 环境与状态

- Node.js v24.18.0 ✅、Python 3.12 ✅
- 前端与控制台的 npm 依赖已安装；Python 依赖（fastapi/uvicorn/pywebview 等）已装
- 控制台 `blogPath` 已预配置指向本机 XHBlogs 目录（`my-blog-manager/data/deploy_config.json`）

## 版本管理

- **本仓库**（外层 git）：记录本地化决策与文档变更，不追踪 XHBlogs 官方代码
- **XHBlogs 代码**：由其自带 git 管理，官方提供 `update.bat` 更新器
- 历史版本：v0.1.0 为旧 Hugo 架构（已废弃，完整保留在 git 历史中）

## 许可说明

XHBlogs 采用 CC BY-NC 4.0：个人非商业使用，二次发布需注明原作者。