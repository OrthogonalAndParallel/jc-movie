## 基于小猫影视2.5.9的开源版本，去除私有库依赖

使用 `Flutter` 构建, 支持 `Android` | `Windows` | `Macos` | `iOS` | `Linux`


### 安装指南 📦

#### **Macos 🍎**

`macOS` 可以使用 [homebrew](https://brew.sh) 快速安装, 也可自行下载安装

[![](https://img.shields.io/badge/-点我下载-blue?logo=github)](https://github.com/waifu-project/movie/releases/latest/download/catmovie-mac.zip
)

> 更新的话可直接使用 `brew reinstall -f yoyo`

```bash
brew tap waifu-project/brew
brew install yoyo
```

#### **Linux 🐧**

[![](https://img.shields.io/badge/-点我下载-blue?logo=github)](https://github.com/waifu-project/movie/releases/latest/download/catmovie-linux-x86_64.tar.gz)

在 `Archlinux` 需要安装两个包

```sh
yay -S webkit2gtk-4.1
yay -S xdg-user-dir xdg-utils
```

#### **Windows 🪟**

在 `Win10` 下, 如果使用 `Webview` 播放器内核, 需要额外安装 [WebView2 Runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2)

> https://docs.microsoft.com/en-us/microsoft-edge/webview2/concepts/distribution

[![](https://img.shields.io/badge/-点我下载-blue?logo=github)](https://github.com/waifu-project/movie/releases/latest/download/catmovie-windows.zip)

#### **Android 🤖**

大部分手机直接使用常用架构包就行了, 通用包兼容多种架构

- [常用(arm64-v8a)](https://github.com/waifu-project/movie/releases/latest/download/catmovie.apk)
- [旧手机(armeabi-v7a)](https://github.com/waifu-project/movie/releases/latest/download/catmovie-legacy.apk)
- [通用(universal)](https://github.com/waifu-project/movie/releases/latest/download/catmovie-universal.apk)

### 文档 📜

- [制作源](./docs/create_source.md)
- [键盘快捷键](./docs/keyboard.md) 
- [解析VIP视频](./docs/parse_vip.md)
- [URL Scheme](./docs/protocol.md)
- [贡献代码](./docs/PR.md)
- [调试代码](./docs/start_dev.md)