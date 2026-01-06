# 目录结构

```
jc-movie
├── docs # 工程说明
│   ├── cli
├── script # 脚本
│   └── ckbot
├── pubspec.yaml # flutter依赖声明
├── assets # 静态资源
│   ├── data
│   └── images
├── design # 设计资源
├── fonts # 字体
├── JS
│   ├── bundle
│   │   └── src
│   ├── cli
│   └── types
├── android
│   ├── app
│   │   └── src
│   └── gradle
│       └── wrapper
├── ios
│   ├── Flutter
│   ├── Runner
│   │   ├── Assets.xcassets
│   │   └── Base.lproj
│   ├── Runner.xcodeproj
│   │   ├── project.xcworkspace
│   │   └── xcshareddata
│   ├── Runner.xcworkspace
│   │   └── xcshareddata
│   └── RunnerTests
├── lib
│   ├── app
│   │   ├── modules
│   │   ├── routes
│   │   ├── shared
│   │   └── widget
│   ├── builtin
│   │   └── maccms
│   ├── isar
│   │   └── schema
│   ├── shared
│   ├── utils
│   └── widget
│       └── simple_html
├── linux
│   └── flutter
├── macos
│   ├── Flutter
│   ├── Runner
│   │   ├── Assets.xcassets
│   │   ├── Base.lproj
│   │   └── Configs
│   ├── Runner.xcodeproj
│   │   ├── project.xcworkspace
│   │   └── xcshareddata
│   ├── Runner.xcworkspace
│   │   └── xcshareddata
│   └── RunnerTests
├── packages
│   ├── simple
│   │   └── lib
│   └── xi
│       └── lib
├── schema
└── windows
    ├── flutter
    └── runner
```

# 常用命令
```
flutter clean # 缓存清理
flutter pub get . # 拉取依赖
flutter pub run build_runner build # 模块化代码生成
flutter run
```