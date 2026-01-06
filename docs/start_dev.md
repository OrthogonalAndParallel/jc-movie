**准备**

* Git
* VSCode 或其他代码编辑器• 
* Flutter SDK
*Bun


**环境变量**

```sh
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
```

**编译**
```sh
flutter doctor # 诊断
flutter pub get # 获取依赖
flutter pub run build_runner build # 构建
```

**JS bun**

```sh
pushd JS/bundle
bun install
bun run build
popd
mkdir -p packages/xi/assets/js
cp JS/bundle/dist/kitty.umd.js packages/xi/assets/js
```

**android**

```sh
flutter doctor --android-licenses
flutter emulators --launch Pixel_7 # 启动模拟器
flutter run -d Pixel_7 # 运行
flutter build apk # 构建 APK（适用于所有安卓设备）
flutter build apk --split-per-abi --target-platform android-arm64 # 构建 新设备APK
flutter build appbundle # 构建 App Bundle （发布到 Google Play 商店）
```

**作者提供**

```sh
git clone https://github.com/waifu-project/movie
cd movie
bash script/fetch_git_info.sh
flutter pub get .
flutter pub run build_runner build
# brew install cocoapods
flutter run
# chmod u+x JS/sync
./JS/sync
pushd packages/xi/lib/adapters/templates
bun install && bun run build
popd
```