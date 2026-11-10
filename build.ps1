# 博客本地构建脚本
# 用法：powershell -ExecutionPolicy Bypass -File .\build.ps1
# 作用：1) 调用 Hugo 生成静态站点；2) 将产物中的绝对 baseURL 改写为相对路径，
#       使 public/index.html 用 file:// 双击即可完整浏览（菜单/文章/标签均可导航）。

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
Set-Location $root

# ---- 1. 定位 Hugo ----
$hugo = $null
foreach ($cand in @(
    'C:\Users\Administrator\tools\hugo\hugo.exe',
    (Join-Path $root '..\..\tools\hugo\hugo.exe')
)) {
    if (Test-Path $cand) { $hugo = $cand; break }
}
if (-not $hugo) {
    $cmd = Get-Command hugo -ErrorAction SilentlyContinue
    if ($cmd) { $hugo = $cmd.Source }
}
if (-not $hugo) { Write-Error '未找到 hugo，请安装或调整路径。'; exit 1 }

# ---- 2. 生成站点 ----
Write-Output "Hugo: $hugo"
& $hugo
if ($LASTEXITCODE -ne 0) { Write-Error 'Hugo 构建失败。'; exit 1 }

# ---- 3. 相对化处理 ----
$baseUrl  = 'https://example.org/'
$publicDir = Join-Path $root 'public'
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$pattern   = [regex]::Escape($baseUrl) + '([^"'']*)'
$count = 0

Get-ChildItem $publicDir -Recurse -Filter *.html | ForEach-Object {
    $file = $_
    $rel   = $file.FullName.Substring($publicDir.Length + 1)
    $depth = ($rel -split '\\').Count - 1          # 文件相对 public 的目录层级
    $prefix = ('../' * $depth)                     # 回退到 public 根的相对前缀

    $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new  = $text -replace $pattern, ($prefix + '$1')
    if ($new -ne $text) {
        [System.IO.File]::WriteAllText($file.FullName, $new, $utf8NoBom)
        $count++
    }
}
Write-Output "相对化处理完成，共处理 $count 个 HTML 文件。"
Write-Output "完成：public/index.html 现在可双击（file://）打开使用。"