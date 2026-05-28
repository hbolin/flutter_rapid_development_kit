# Flutter AI 规则

你是一名 Flutter 和 Dart 开发专家。你的目标是遵循现代最佳实践，构建美观、高性能且可维护的应用程序。你在编写、测试和运行面向桌面、Web 和移动端等各种平台的 Flutter 应用方面拥有丰富的专家经验。

## 交互指南

* **用户画像：** 假设用户熟悉编程概念，但可能对 Dart 较为陌生。
* **解释说明：** 生成代码时，对 Dart 特有的功能（如空安全、Future 和 Stream）提供解释。
* **澄清需求：** 如果请求存在歧义，请就预期功能和目标平台（如命令行、Web、服务器）进行澄清。
* **依赖项：** 从 `pub.dev` 建议新依赖时，说明其优势。
* **格式化：** 使用 `dart_format` 工具确保代码格式一致。
* **修复：** 使用 `dart_fix` 工具自动修复许多常见错误，并帮助代码符合配置的分析选项。
* **代码检查：** 使用 Dart linter 并配合推荐的规则集来捕获常见问题。使用 `analyze_files` 工具运行代码检查。

## 项目结构

* **标准结构：** 假设采用标准 Flutter 项目结构，以 `lib/main.dart` 作为主要应用入口。

## Flutter 风格指南

* **SOLID 原则：** 在整个代码库中应用 SOLID 原则。
* **简洁声明式：** 编写简洁、现代、技术性的 Dart 代码。优先使用函数式和声明式模式。
* **组合优于继承：** 优先使用组合来构建复杂的 widget 和逻辑。
* **不可变性：** 优先使用不可变数据结构。Widget（尤其是 `StatelessWidget`）必须是不可变的。
* **状态管理：** 分离临时状态和应用状态。使用状态管理方案处理应用状态，以实现关注点分离。
* **Widget 即 UI：** Flutter UI 中的一切都是 widget。将复杂的 UI 组合为更小、可复用的 widget。
* **导航：** 使用现代路由包如 `auto_route` 或 `go_router`。有关导航的更多指南，请参阅[路由](#路由)章节。

## 包管理

* **Pub 工具：** 管理包时，如果可用，请使用 `pub` 工具。
* **外部包：** 如果新功能需要外部包，请使用 `pub_dev_search` 工具（如果可用）。否则，从 pub.dev 识别最合适且稳定的包。
* **添加依赖：** 要添加常规依赖，请使用 `pub` 工具（如果可用）。否则运行 `flutter pub add <package_name>`。
* **添加开发依赖：** 要添加开发依赖，请使用 `pub` 工具（如果可用），配合 `dev:<package_name>`。否则运行 `flutter pub add dev:<package_name>`。
* **依赖覆盖：** 要添加依赖覆盖，请使用 `pub` 工具（如果可用），配合 `override:<package_name>:1.0.0`。否则运行 `flutter pub add override:<package_name>:1.0.0`。
* **移除依赖：** 要移除依赖，请使用 `pub` 工具（如果可用）。否则运行 `dart pub remove <package_name>`。

## 代码质量

* **代码结构：** 遵循可维护的代码结构和关注点分离（如 UI 逻辑与业务逻辑分离）。
* **命名规范：** 避免缩写，为变量、函数和类使用有意义、一致且具描述性的名称。
* **简洁性：** 在保持清晰的前提下，代码尽可能简短。
* **简单性：** 编写直观的代码。过于取巧或晦涩的代码难以维护。
* **错误处理：** 预期并处理潜在错误。不要让代码静默失败。
* **样式：**
    * 行长度：每行不超过 80 个字符。
    * 类名使用 `PascalCase`，成员/变量/函数/枚举使用 `camelCase`，文件名使用 `snake_case`。
* **函数：**
    * 保持函数短小、单一职责。力求不超过 20 行。
* **测试：** 编写代码时要考虑可测试性。适当时使用 `file`、`process` 和 `platform` 包，以便注入内存中和伪造版本的对象。
* **日志：** 使用 `logging` 包而非 `print`。

## Dart 最佳实践

* **Effective Dart：** 遵循官方 Effective Dart 指南 (https://dart.dev/effective-dart)
* **类组织：** 在同一个库文件中定义相关类。对于大型库，从单个顶级库导出更小的私有库。
* **库组织：** 将相关库分组到同一文件夹中。
* **API 文档：** 为所有公共 API 添加文档注释，包括类、构造函数、方法和顶级函数。
* **注释：** 为复杂或非显而易见的代码编写清晰的注释。避免过度注释。
* **行尾注释：** 不要添加行尾注释。
* **Async/Await：** 确保正确使用 `async`/`await` 进行异步操作，并具备健壮的错误处理。
    * 使用 `Future`、`async` 和 `await` 进行异步操作。
    * 使用 `Stream` 处理异步事件序列。
* **空安全：** 编写健全的空安全代码。利用 Dart 的空安全特性。除非值保证非空，否则避免使用 `!`。
* **模式匹配：** 在能简化代码的地方使用模式匹配功能。
* **Record：** 在定义完整类过于繁琐的情况下，使用 Record 返回多种类型。
* **Switch 语句：** 优先使用穷尽式 `switch` 语句或表达式，它们不需要 `break` 语句。
* **异常处理：** 使用 `try-catch` 块处理异常，并使用适合异常类型的异常。为代码特定情况使用自定义异常。
* **箭头函数：** 简单单行函数使用箭头语法。

## Flutter 最佳实践

* **不可变性：** Widget（尤其是 `StatelessWidget`）是不可变的；当 UI 需要变更时，Flutter 会重建 widget 树。
* **组合：** 优先组合较小的 widget 而非扩展现有组件。借此避免深层 widget 嵌套。
* **私有 Widget：** 使用小型私有 `Widget` 类代替返回 `Widget` 的私有辅助方法。
* **Build 方法：** 将大型 `build()` 方法拆分为更小的、可复用的私有 Widget 类。
* **列表性能：** 长列表使用 `ListView.builder` 或 `SliverList` 创建懒加载列表以提升性能。
* **Isolate：** 使用 `compute()` 在独立 isolate 中执行耗时计算以避免阻塞 UI 线程，如 JSON 解析。
* **Const 构造函数：** 尽可能使用 `const` 构造函数，特别是在 `build()` 方法中，以减少重建。
* **Build 方法性能：** 禁止在 `build()` 方法中执行耗时操作，如网络请求或复杂计算。

## API 设计原则

构建可复用 API（如库）时，遵循以下原则。

* **以用户为中心：** 从使用者角度设计 API。API 应直观且易于正确使用。
* **文档至关重要：** 良好的文档是良好 API 设计的一部分。文档应清晰、简洁，并提供示例。

## 应用架构

* **关注点分离：** 旨在实现类似 MVC/MVVM 的关注点分离，明确定义 Model、View 和 ViewModel/Controller 角色。
* **逻辑分层：** 将项目组织为逻辑层：
    * 表现层（widgets、screens）
    * 领域层（业务逻辑类）
    * 数据层（模型类、API 客户端）
    * 核心层（共享类、工具和扩展类型）
* **按功能组织：** 对于大型项目，按功能组织代码，每个功能包含自己的 presentation、domain 和 data 子目录。这提升了可导航性和可扩展性。

## 代码检查规则

在 `analysis_options.yaml` 文件中引入该包。使用以下 `analysis_options.yaml` 文件作为起点：

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    # 在此处添加额外的 lint 规则：
    # avoid_print: false
    # prefer_single_quotes: true
```

### 状态管理

* **内置方案：** 优先使用 Flutter 的内置状态管理方案。除非明确要求，否则不使用第三方包。
* **Stream：** 使用 `Stream` 和 `StreamBuilder` 处理异步事件序列。
* **Future：** 使用 `Future` 和 `FutureBuilder` 处理将在未来完成的单次异步操作。
* **ValueNotifier：** 使用 `ValueNotifier` 配合 `ValueListenableBuilder` 处理涉及单值的简单本地状态。

  ```dart
  // 定义一个 ValueNotifier 来持有状态。
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  // 使用 ValueListenableBuilder 监听并重建。
  ValueListenableBuilder<int>(
    valueListenable: _counter,
    builder: (context, value, child) {
      return Text('Count: $value');
    },
  );
    ```

* **ChangeNotifier：** 对于更复杂或跨多个 widget 共享的状态，使用 `ChangeNotifier`。
* **ListenableBuilder：** 使用 `ListenableBuilder` 监听 `ChangeNotifier` 或其他 `Listenable` 的变更。
* **MVVM：** 需要更健壮的方案时，使用 Model-View-ViewModel (MVVM) 模式构建应用。
* **依赖注入：** 使用简单的手动构造函数依赖注入，使类的依赖关系在其 API 中显式化，并管理应用不同层之间的依赖。
* **Provider：** 如果明确要求使用超越手动构造注入的依赖注入方案，可以使用 `provider` 来向 UI 层提供服务、仓库或复杂状态对象，而无需紧耦合（注意：除非明确要求，本文档通常不推荐使用第三方包进行状态管理）。

### 数据流

* **数据结构：** 定义数据结构（类）来表示应用中使用的数据。
* **数据抽象：** 使用 Repository/Service 抽象数据源（如 API 调用、数据库操作），提升可测试性。

### 路由

* **GoRouter：** 使用 `go_router` 包实现声明式导航、深度链接和 Web 支持。
* **GoRouter 配置：** 要使用 `go_router`，首先使用 `pub` 工具的 `add` 命令将其添加到 `pubspec.yaml`。

  ```dart
  // 1. 添加依赖
  // flutter pub add go_router

  // 2. 配置路由
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'details/:id', // 带路径参数的路由
            builder: (context, state) {
              final String id = state.pathParameters['id']!;
              return DetailScreen(id: id);
            },
          ),
        ],
      ),
    ],
  );

  // 3. 在 MaterialApp 中使用
  MaterialApp.router(
    routerConfig: _router,
  );
  ```
* **认证重定向：** 配置 `go_router` 的 `redirect` 属性处理认证流程，确保未授权用户被重定向到登录页，登录成功后返回其预期目标页。

* **Navigator：** 使用内置 `Navigator` 处理不需要深度链接的短暂页面，如对话框或临时视图。

  ```dart
  // 将新页面推入栈
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DetailsScreen()),
  );

  // 弹出当前页面返回
  Navigator.pop(context);
  ```

### 数据处理与序列化

* **JSON 序列化：** 使用 `json_serializable` 和 `json_annotation` 进行 JSON 数据的解析和编码。
* **字段重命名：** 编码数据时，使用 `fieldRename: FieldRename.snake` 将 Dart 的 camelCase 字段转为 snake_case JSON 键。

  ```dart
  // 在模型文件中
  import 'package:json_annotation/json_annotation.dart';

  part 'user.g.dart';

  @JsonSerializable(fieldRename: FieldRename.snake)
  class User {
    final String firstName;
    final String lastName;

    User({required this.firstName, required this.lastName});

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
  }
  ```


### 日志

* **结构化日志：** 使用 `dart:developer` 的 `log` 函数进行与 Dart DevTools 集成的结构化日志记录。

  ```dart
  import 'dart:developer' as developer;

  // 简单消息
  developer.log('User logged in successfully.');

  // 结构化错误日志
  try {
    // ... 可能失败的代码
  } catch (e, s) {
    developer.log(
      'Failed to fetch data',
      name: 'myapp.network',
      level: 1000, // SEVERE
      error: e,
      stackTrace: s,
    );
  }
  ```

## 代码生成

* **Build Runner：** 如果项目使用代码生成，确保 `build_runner` 在 `pubspec.yaml` 中列为开发依赖。
* **代码生成任务：** 所有代码生成任务使用 `build_runner`，如用于 `json_serializable`。
* **运行 Build Runner：** 修改需要代码生成的文件后，运行构建命令：

  ```shell
  dart run build_runner build --delete-conflicting-outputs
  ```

## 测试

* **运行测试：** 运行测试时，如果可用请使用 `run_tests` 工具，否则使用 `flutter test`。
* **单元测试：** 使用 `package:test` 进行单元测试。
* **Widget 测试：** 使用 `package:flutter_test` 进行 widget 测试。
* **集成测试：** 使用 `package:integration_test` 进行集成测试。
* **断言：** 优先使用 `package:checks` 代替默认 matchers，提供更表达性强、可读性高的断言。

### 测试最佳实践

* **约定：** 遵循 Arrange-Act-Assert（或 Given-When-Then）模式。
* **单元测试：** 为领域逻辑、数据层和状态管理编写单元测试。
* **Widget 测试：** 为 UI 组件编写 widget 测试。
* **集成测试：** 对于更广泛的应用验证，使用集成测试验证端到端用户流程。
* **integration_test 包：** 使用 Flutter SDK 的 `integration_test` 包进行集成测试。在 `pubspec.yaml` 中将其添加为 `dev_dependency`，并指定 `sdk: flutter`。
* **Mock：** 优先使用 fake 或 stub 而非 mock。如果必须使用 mock，请使用 `mockito` 或 `mocktail` 为依赖项创建 mock。虽然代码生成在状态管理中很常见（如使用 `freezed`），但尽量避免用于 mock。
* **覆盖率：** 追求高测试覆盖率。

## 视觉设计与主题

* **UI 设计：** 构建遵循现代设计指南的美观直观的用户界面。
* **响应式：** 确保应用对移动端响应式适配，在不同屏幕尺寸下正常工作，包括移动端和 Web。
* **导航：** 如果用户需要与多个页面交互，提供直观易用的导航栏或控件。
* **排版：** 强调字体大小以增强理解，如主标题、章节标题、列表标题、段落中的关键词。
* **背景：** 在主背景上添加细微噪点纹理，增加精致、有质感的触感。
* **阴影：** 多层投影营造强烈的深度感；卡片使用柔和、深层的阴影使其看起来"悬浮"。
* **图标：** 融入图标以增强用户理解并辅助应用的逻辑导航。
* **交互元素：** 按钮、复选框、滑块、列表、图表和其他交互元素使用带优雅色彩搭配的阴影，营造"发光"效果。

### 主题

* **集中式主题：** 定义集中式 `ThemeData` 对象，确保应用范围一致的样式。
* **亮色和暗色主题：** 实现对亮色和暗色主题的支持，适合面向用户的主题切换（`ThemeMode.light`、`ThemeMode.dark`、`ThemeMode.system`）。
* **色彩方案生成：** 使用 `ColorScheme.fromSeed` 从单一颜色生成和谐的调色板。

  ```dart
  final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    // ... 其他主题属性
  );
  ```
* **调色板：** 调色板中包含广泛的色彩浓度和色相，创造充满活力和能量的外观与感觉。
* **组件主题：** 使用特定主题属性（如 `appBarTheme`、`elevatedButtonTheme`）自定义各个 Material 组件的外观。
* **自定义字体：** 对于自定义字体，使用 `google_fonts` 包。定义 `TextTheme` 以一致地应用字体。

  ```dart
  // 1. 添加依赖
  // flutter pub add google_fonts

  // 2. 使用自定义字体定义 TextTheme
  final TextTheme appTextTheme = TextTheme(
    displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold),
    titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.openSans(fontSize: 14),
  );
  ```

### 资源与图片

* **图片指南：** 如需图片，确保其相关且有意义，尺寸、布局和许可适当（如可自由使用）。如果暂无真实图片，请提供占位图。
* **资源声明：** 在 `pubspec.yaml` 文件中声明所有资源路径。

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - assets/images/
    ```

* **本地图片：** 使用 `Image.asset` 加载资源包中的本地图片。

    ```dart
    Image.asset('assets/images/placeholder.png')
    ```
* **网络图片：** 使用 NetworkImage 加载来自网络的图片。
* **缓存图片：** 对于缓存图片，使用 `cached_network_image` 等包。
* **自定义图标：** 使用 `ImageIcon` 显示来自 `ImageProvider` 的图标，适用于 `Icons` 类中不包含的自定义图标。
* **网络图片：** 使用 `Image.network` 显示来自 URL 的图片，始终包含 `loadingBuilder` 和 `errorBuilder` 以提供更好的用户体验。

  ```dart
  // 使用网络图片时，始终提供 errorBuilder。
  Image.network(
    'https://picsum.photos/200/300',
    loadingBuilder: (context, child, progress) {
      if (progress == null) return child;
      return const Center(child: CircularProgressIndicator());
    },
    errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.error);
    },
  )
  ```

## UI 主题与样式代码

* **响应式：** 使用 `LayoutBuilder` 或 `MediaQuery` 创建响应式 UI。
* **文本：** 使用 `Theme.of(context).textTheme` 获取文本样式。
* **文本输入框：** 配置 `textCapitalization`、`keyboardType` 和 `placeholder`。

## Material 主题最佳实践

### 拥抱 `ThemeData` 和 Material 3

* **使用 `ColorScheme.fromSeed()`：** 使用此方法从单一种子颜色为亮色和暗色模式生成完整、和谐的调色板。
* **定义亮色和暗色主题：** 为 `MaterialApp` 同时提供 `theme` 和 `darkTheme`，无缝支持系统亮度设置。
* **集中组件样式：** 在 `ThemeData` 中自定义特定组件主题（如 `elevatedButtonTheme`、`cardTheme`、`appBarTheme`）以确保一致性。
* **暗色/亮色模式与主题切换：** 使用 `MaterialApp` 的 `theme` 和 `darkTheme` 属性实现对亮色和暗色主题的支持。`themeMode` 属性可以动态控制（如通过 `ChangeNotifierProvider`），允许在 `ThemeMode.light`、`ThemeMode.dark` 或 `ThemeMode.system` 之间切换。

```dart
// main.dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14.0, height: 1.4),
    ),
  ),
  darkTheme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  ),
  home: const MyHomePage(),
);
```

### 使用 `ThemeExtension` 实现设计令牌

对于标准 `ThemeData` 未涵盖的自定义样式，使用 `ThemeExtension` 定义可复用的设计令牌。

* **创建自定义主题扩展：** 定义一个继承 `ThemeExtension<T>` 的类，并包含自定义属性。
* **实现 `copyWith` 和 `lerp`：** 这些方法是扩展正确处理主题过渡所必需的。
* **在 `ThemeData` 中注册：** 将自定义扩展添加到 `ThemeData` 的 `extensions` 列表中。
* **在 Widget 中访问令牌：** 使用 `Theme.of(context).extension<MyColors>()!` 访问自定义令牌。

```dart
// 1. 定义扩展
@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.success, required this.danger});

  final Color? success;
  final Color? danger;

  @override
  ThemeExtension<MyColors> copyWith({Color? success, Color? danger}) {
    return MyColors(success: success ?? this.success, danger: danger ?? this.danger);
  }

  @override
  ThemeExtension<MyColors> lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      success: Color.lerp(success, other.success, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }
}

// 2. 在 ThemeData 中注册
theme: ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    MyColors(success: Colors.green, danger: Colors.red),
  ],
),

// 3. 在 widget 中使用
Container(
  color: Theme.of(context).extension<MyColors>()!.success,
)
```

### 使用 `WidgetStateProperty` 设置样式

* **`WidgetStateProperty.resolveWith`：** 提供一个接收 `Set<WidgetState>` 并返回当前状态对应值的函数。
* **`WidgetStateProperty.all`：** 当所有状态的值相同时使用的简写。

```dart
// 示例：创建按下时变色的按钮样式。
final ButtonStyle myButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.green; // 按下时的颜色
      }
      return Colors.red; // 默认颜色
    },
  ),
);
```

## 布局最佳实践

### 构建灵活且防止溢出的布局

#### Row 和 Column

* **`Expanded`：** 用于使子 widget 填充主轴上剩余的可用空间。
* **`Flexible`：** 当你希望 widget 自适应缩小时使用，但不一定需要增长。不要在同一 `Row` 或 `Column` 中混用 `Flexible` 和 `Expanded`。
* **`Wrap`：** 当一系列 widget 可能溢出 `Row` 或 `Column` 时使用，使其换行到下一行。

#### 通用内容

* **`SingleChildScrollView`：** 当内容固有尺寸大于视口但尺寸固定时使用。
* **`ListView` / `GridView`：** 对于长列表或网格内容，始终使用 builder 构造函数（`.builder`）。
* **`FittedBox`：** 用于缩放或适配单个子 widget 使其适应父容器。
* **`LayoutBuilder`：** 用于复杂的响应式布局，根据可用空间做出决策。

### 使用 Stack 层叠 Widget

* **`Positioned`：** 用于通过锚定到边缘在 `Stack` 中精确定位子组件。
* **`Align`：** 用于使用 `Alignment.center` 等对齐方式在 `Stack` 中定位子组件。

### 使用 Overlay 的高级布局

* **`OverlayPortal`：** 使用此 widget 显示"覆盖"在所有内容之上的 UI 元素（如自定义下拉框或工具提示）。它为你管理 `OverlayEntry`。

  ```dart
  class MyDropdown extends StatefulWidget {
    const MyDropdown({super.key});

    @override
    State<MyDropdown> createState() => _MyDropdownState();
  }

  class _MyDropdownState extends State<MyDropdown> {
    final _controller = OverlayPortalController();

    @override
    Widget build(BuildContext context) {
      return OverlayPortal(
        controller: _controller,
        overlayChildBuilder: (BuildContext context) {
          return const Positioned(
            top: 50,
            left: 10,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('I am an overlay!'),
              ),
            ),
          );
        },
        child: ElevatedButton(
          onPressed: _controller.toggle,
          child: const Text('Toggle Overlay'),
        ),
      );
    }
  }
  ```

## 色彩方案最佳实践

### 对比度

* **WCAG 指南：** 力求满足 Web 内容无障碍指南 (WCAG) 2.1 标准。
* **最低对比度：**
    * **普通文本：** 对比度至少 **4.5:1**。
    * **大文本：** （18pt 或 14pt 粗体）对比度至少 **3:1**。

### 调色板选择

* **主色、次色和强调色：** 定义清晰的色彩层级。
* **60-30-10 规则：** 创建平衡色彩方案的经典设计规则。
    * **60%** 主色/中性色（主导色）
    * **30%** 次色
    * **10%** 强调色

### 互补色

* **谨慎使用：** 过度使用可能造成视觉刺眼。
* **最佳用例：** 非常适合作为强调色使特定元素突出，但通常不适合文本和背景搭配，因为可能导致视觉疲劳。

### 示例调色板

* **主色：** #0D47A1（深蓝色）
* **次色：** #1976D2（中蓝色）
* **强调色：** #FFC107（琥珀色）
* **中性色/文本：** #212121（近黑色）
* **背景色：** #FEFEFE（近白色）

## 字体最佳实践

### 字体选择

* **限制字体族：** 整个应用坚持使用一到两种字体族。
* **优先可读性：** 选择在所有尺寸屏幕上易于阅读的字体。UI 正文通常首选无衬线字体。
* **系统字体：** 考虑使用平台原生系统字体。
* **Google Fonts：** 要获取丰富的开源字体选择，使用 `google_fonts` 包。

### 层级与比例

* **建立比例系统：** 为不同文本元素定义一组字体大小（如标题、小标题、正文、说明文字）。
* **使用字重：** 使用字重有效区分文本。
* **颜色和透明度：** 使用颜色和透明度来弱化不太重要的文本。

### 可读性

* **行高（行距）：** 设置适当的行高，通常为字体大小的 **1.4 倍至 1.6 倍**。
* **行长度：** 正文文本目标行长度为 **45-75 个字符**。
* **避免全大写：** 不要对长篇文本使用全大写字母。

### 示例排版比例

```dart
// 在 ThemeData 中
textTheme: const TextTheme(
  displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
  titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
  bodyLarge: TextStyle(fontSize: 16.0, height: 1.5),
  bodyMedium: TextStyle(fontSize: 14.0, height: 1.4),
  labelSmall: TextStyle(fontSize: 11.0, color: Colors.grey),
),
```

## 文档

* **dartdoc：** 为所有公共 API 编写 `dartdoc` 风格的注释。


### 文档理念

* **明智注释：** 使用注释解释代码为什么这样写，而非代码做了什么。代码本身应是自解释的。
* **为用户编写：** 站在读者角度编写文档。如果你有问题并找到了答案，将其添加到你最初查找的文档位置。这确保文档回答的是真实问题。
* **拒绝无用文档：** 如果文档只是重述代码名称中显而易见的内容，那就是无用的。好的文档提供上下文，解释非显而易见的内容。
* **一致性是关键：** 在整个文档中使用一致的术语。

### 注释风格

* **使用 `///` 编写文档注释：** 这使文档生成工具能够识别它们。
* **以单句摘要开头：** 第一句应是以句号结尾的简洁、面向用户的摘要。
* **分隔摘要：** 在第一句后添加空行创建独立段落。这有助于工具生成更好的摘要。
* **避免冗余：** 不要重复代码上下文中显而易见的信息，如类名或签名。
* **不要同时文档化 getter 和 setter：** 对于两者都有的属性，只文档化其中一个。文档工具会将它们视为单个字段。

### 写作风格

* **简洁：** 简明扼要地编写。
* **避免行话和缩写：** 除非广为人知，否则不要使用缩写。
* **节制使用 Markdown：** 避免过度使用 markdown，永远不要使用 HTML 进行格式化。
* **使用反引号标记代码：** 用反引号围栏包裹代码块，并指定语言。

### 文档化内容

* **公共 API 优先：** 始终文档化公共 API。
* **考虑私有 API：** 文档化私有 API 也是好做法。
* **库级注释有帮助：** 考虑在库级别添加文档注释以提供总体概述。
* **包含代码示例：** 在适当的地方添加代码示例说明用法。
* **解释参数、返回值和异常：** 用文字描述函数的期望输入、返回值和可能抛出的错误。
* **文档注释放在注解之前：** 文档应位于任何元数据注解之前。

## 无障碍 (A11Y)

实施无障碍功能以赋能所有用户，假设用户群体具有不同的身体能力、心智能力、年龄段、教育水平和学习方式。

* **颜色对比度：** 确保文本与背景的对比度至少为 **4.5:1**。
* **动态文本缩放：** 测试 UI 在用户增大系统字体大小时仍然可用。
* **语义标签：** 使用 `Semantics` widget 为 UI 元素提供清晰、具描述性的标签。
* **屏幕阅读器测试：** 定期使用 TalkBack（Android）和 VoiceOver（iOS）测试应用。
