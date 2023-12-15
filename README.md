## Flutter 版本

基于flutter_macos_arm64_3.16.3-stable版本创建项目

## 使用BasePage

### 第一步

导入flutter_rapid_development_kit

```dart
flutter_rapid_development_kit:
  git:
    url: "https://github.com/hbolin/flutter_rapid_development_kit"
    ref: "2.0.1"
```

### 第二步

将routeObserver配置到MaterialApp的navigatorObservers属性中，如下所示：

```dart
MaterialApp(
  navigatorObservers: <RouteObserver<ModalRoute<void>>>[
    routeObserver,
  ],
);
```

### 第三步

安装[my_getx_template](./资源/my_getx_template-2.0.2.jar)插件

### 第四步

配置路由

```dart
class RouteUtil {
  static String initialRoute = const TestAppBase3Page().getRouteName();

  static final List<GetPage> initialPages = [
    GetPage(
      name: initialRoute,
      page: () => const TestAppBase3Page(),
    ),
    GetPage(
      name: const TestAppBase4Page().getRouteName(),
      page: () => TestAppBase4Page.fromRouteParas(Get.parameters),
    ),
  ];
}
```