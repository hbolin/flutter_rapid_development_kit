# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 在此仓库中工作时提供指导。

## 项目概述

基于 GetX 的 Flutter 工具/组件包（FRDK），用于快速应用开发。版本通过 git tag 追踪（当前：v3.1.5）。所有文档注释和行内注释均使用中文。

## 常用命令

```bash
# 静态分析
dart analyze lib/

# 格式检查
dart format lib/ --output=show --set-exit-if-changed

# 运行所有测试
flutter test

# 运行单个测试
flutter test test/src/util/base64_util_test.dart
```

## 架构

### GetX + BasePage 模式

核心架构是 `BasePage`（`lib/src/page/base_page.dart`），基于 GetX 的页面框架：

- **`BasePageStatefulWidget`** — 抽象 Widget，定义路由名称和参数
- **`BasePageState<K, S, T>`** — 抽象 State，关联 GetX 控制器 + 状态 + 加载生命周期。泛型参数：K（Widget）、S（状态）、T（控制器）
- **`BasePageGetxController<S>`** — 抽象 GetxController，提供 `loadData`/`needLoadCachedData`/`needLoadData` 钩子及路由生命周期（`didPush`/`didPop`/`didPushNext`/`didPopNext`）
- **`BasePageBaseState<T>`** — 持有 Widget 引用和 `isLoadRealDataSuccess` 标志

路由观察者 `frdkRouteObserver` 必须注册到 `GetMaterialApp(navigatorObservers: [frdkRouteObserver])`。

### 三级加载体系

1. **`LoadingBody`** — 简单流程：加载中 → 成功/失败。内部使用 `FutureBuilder`。控制器：`LoadingBodyController.reloadData()`
2. **`CachedLoadingBody`** — 两阶段流程：加载中 → 缓存数据 → 真实数据。内部使用 `StreamBuilder`。缓存成功但真实数据失败时，显示缓存数据并弹出 toast 提示。控制器：`CachedLoadingBodyController.reloadData()`
3. **`LoadingUtil`** — 模态加载对话框（用户不可关闭）。使用 `RawDialogRoute`，依赖 `Get.context`

LoadingBody 和 CachedLoadingBody 均使用 `synchronized` Lock 防止并发加载。

### Widget 定制优先级

`buildCustom*`（页面级覆盖）> `BasePageGlobalConfig`（应用级 InheritedWidget）> `buildDefault*`（内置默认）

## 编码规范

- **状态管理：** 统一使用 GetX（`Get.put`、`Get.find`、`GetBuilder`）。控制器继承 `GetxController`
- **扩展命名：** 使用 `Frdk` 前缀（如 `FrdkListExtensions`）
- **工具类：** 私有构造函数（`const UtilClass._()`）+ 静态方法
- **Widget-Controller 配对模式：** 复杂组件搭配 Controller 类，持有 State 引用并暴露 `reloadData()`
- **Builder 回调：** 组件广泛使用 builder 模式（`bodyBuilder`、`loadingWidgetBuilder` 等）
- **分隔组件：** `SeparatedColumn`/`Row`/`Wrap` 共用相同 API：`itemCount` + `itemBuilder` + `separatorBuilder`

## Lint 与代码风格

- 引用 `package:flutter_lints/flutter.yaml`
- `require_trailing_commas: true` — 必须使用尾逗号
- `prefer_const_constructors: true` — 优先使用 const 构造
- `unnecessary_this: false` — 允许且常用 `this.field`
- `prefer_relative_imports: true` — 优先使用相对导入
- 格式化：`trailing_commas: preserve`
