import 'dart:io';

import 'package:process_run/process_run.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

class ProjectMaker {
  /// 生成项目
  /// [flutterPath] flutter地址
  /// [packageName] 包名
  /// [targetProjectDirectoryPath] 生成项目地址
  static Future<void> makeProject({
    required String flutterPath,
    required String targetProjectDirectoryPath,
    required String packageName,
    bool needGit = true,
  }) async {
    await ProjectMaker.createFlutterProject(
      flutterPath: flutterPath,
      targetProjectDirectoryPath: targetProjectDirectoryPath,
      packageName: packageName,
    );

    if (needGit) {
      var shell = Shell(commandVerbose: false);
      shell = shell.cd(targetProjectDirectoryPath);
      String commandLine = 'git init';
      await shell.run(commandLine);
      commandLine = 'git add .';
      await shell.run(commandLine);
      commandLine = 'git commit -m "first commit"';
      await shell.run(commandLine);
    }

    ProjectMaker.importDependencies(targetProjectDirectoryPath: targetProjectDirectoryPath);

    ProjectMaker.modifyMainDartFile(
      targetProjectDirectoryPath: targetProjectDirectoryPath,
      packageName: packageName,
    );

    ProjectMaker.createTemplateFiles(targetProjectDirectoryPath: targetProjectDirectoryPath);

    ProjectMaker.makeImageAssets(targetProjectDirectoryPath: targetProjectDirectoryPath);

    ProjectMaker.makeMakers(targetProjectDirectoryPath: targetProjectDirectoryPath);

    ProjectMaker.addLinterRules(targetProjectDirectoryPath: targetProjectDirectoryPath);

    if (needGit) {
      var shell2 = Shell(commandVerbose: false);
      shell2 = shell2.cd(targetProjectDirectoryPath);
      String commandLine2 = 'git add .';
      await shell2.run(commandLine2);
      commandLine2 = 'git commit -m "add template code"';
      await shell2.run(commandLine2);
    }
  }

  /// 创建Flutter项目
  /// [flutterPath] flutter地址
  /// [packageName] 包名
  /// [targetProjectDirectoryPath] 生成项目地址
  static Future<void> createFlutterProject({
    required String flutterPath,
    required String targetProjectDirectoryPath,
    required String packageName,
  }) async {
    var targetProjectDirectory = Directory(targetProjectDirectoryPath);
    if (targetProjectDirectory.existsSync()) {
      throw "该项目已存在：${targetProjectDirectory.path}";
    }

    /// 组织架构的名字，使用flutter create的时候需要用到
    String org = packageName.substring(0, packageName.lastIndexOf("."));

    /// 需要生成的app的目录地址
    String targetProjectName = packageName.split(".").last;

    var shell = Shell(commandVerbose: false);

    String commandLine = 'echo "------------------------------------------ 开始创建Flutter项目 ------------------------------------------"';
    await shell.run(commandLine);

    /// 创建项目
    /// Usage: flutter create <output directory>
    /// --org                    The organization responsible for your new Flutter project, in reverse domain name notation. This string is used in Java package names and as prefix in the iOS bundle identifier.
    ///                          (defaults to "com.example")
    /// --project-name           The project name for this new Flutter project. This must be a valid dart package name.
    commandLine = '$flutterPath create "${targetProjectDirectory.path}" --org "$org" --project-name "$targetProjectName"';
    print("执行创建Flutter项目命令：$commandLine\n");
    await shell.run(commandLine);
    print("Flutter项目创建完成！！！\n");
  }

  /// 导入依赖
  static void importDependencies({
    required String targetProjectDirectoryPath,
  }) {
    String yamlFilePath = "$targetProjectDirectoryPath/pubspec.yaml";
    var yamlMap = _parseYamlFile(yamlFilePath);
    var yamLines = _readYamlFile(yamlFilePath);

    if (yamlMap["dependencies"] == null) {
      throw "未找到dependencies节点";
    }

    // print((yamlMap["dependencies"] as YamlMap).span.end.line);

    yamLines.insert((yamlMap["dependencies"] as YamlMap).span.end.line, "  flutter_rapid_development_kit: ");
    yamLines.insert((yamlMap["dependencies"] as YamlMap).span.end.line + 1, "    git:");
    yamLines.insert((yamlMap["dependencies"] as YamlMap).span.end.line + 2, "      url: \"https://github.com/hbolin/flutter_rapid_development_kit\"");
    yamLines.insert((yamlMap["dependencies"] as YamlMap).span.end.line + 3, "      ref: \"v3.1.2\"");
    yamLines.insert((yamlMap["dependencies"] as YamlMap).span.end.line + 4, "");

    // print(yamLines.join("\n"));
    File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
  }

  /// 修改main.dart文件
  static void modifyMainDartFile({
    required String targetProjectDirectoryPath,
    required String packageName,
  }) {
    File mainDartFile = File("$targetProjectDirectoryPath/lib/main.dart");
    if (!mainDartFile.existsSync()) {
      throw "main.dart文件不存在";
    }

    /// 需要生成的app的目录地址
    String targetProjectName = packageName.split(".").last;

    List<String> mainDartFileContentLines = mainDartFile.readAsLinesSync();
    int homeLineIndex = mainDartFileContentLines.indexWhere((e) => e.startsWith("      home: "));
    if (homeLineIndex < 0) {
      throw "未找到home: 节点";
    }
    mainDartFileContentLines[homeLineIndex] = "//${mainDartFileContentLines[homeLineIndex]}";
    mainDartFileContentLines.insert(homeLineIndex + 1, "      initialRoute: RouteUtil.initialRoute,");
    mainDartFileContentLines.insert(homeLineIndex + 2, "      getPages: RouteUtil.initialPages,");
    mainDartFileContentLines.insert(homeLineIndex + 3, "      navigatorObservers: <RouteObserver<ModalRoute<void>>>[");
    mainDartFileContentLines.insert(homeLineIndex + 4, "        frdkRouteObserver,");
    mainDartFileContentLines.insert(homeLineIndex + 5, "      ],");
    mainDartFileContentLines.insert(1, "import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';");
    mainDartFileContentLines.insert(0, "import 'package:$targetProjectName/route_util.dart';");
    mainDartFile.writeAsStringSync(mainDartFileContentLines.join("\n"));

    String mainDartFileContent = mainDartFile.readAsStringSync();
    if (mainDartFileContent.contains("MaterialApp") != true) {
      throw "main.dart文件不包含MaterialApp";
    }
    mainDartFileContent = '''
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:$targetProjectName/application.dart';
import 'package:$targetProjectName/services/global_service.dart';

Future<void> main() async {
  Widget application = await startApplication();

  runApp(application);
}

Future<Widget> startApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  // android 平台，沉浸式状态栏实现
  if (UniversalPlatform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  await GlobalService.init();

  return Application();
}
''';
    mainDartFile.writeAsStringSync(mainDartFileContent);

    File globalServiceFile = File("$targetProjectDirectoryPath/lib/services/global_service.dart");
    if (globalServiceFile.existsSync() != true) {
      globalServiceFile.createSync(recursive: true);
      globalServiceFile.writeAsStringSync('''
import 'package:get/get.dart';

class GlobalService extends GetxService {
  // -------------------------- GlobalService 初始化 start --------------------------
  GlobalService._();

  static GlobalService get instance => Get.find<GlobalService>();

  static Future<GlobalService> init() async {
    var globalService = Get.put<GlobalService>(GlobalService._());
    return globalService;
  }
}
''');
    }

    File applicationFile = File("$targetProjectDirectoryPath/lib/application.dart");
    if (applicationFile.existsSync() != true) {
      applicationFile.createSync(recursive: true);
      applicationFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:$targetProjectName/route_util.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BasePageGlobalConfig(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RouteUtil.initialRoute,
        getPages: RouteUtil.initialPages,
        navigatorObservers: <RouteObserver<ModalRoute<void>>>[
          frdkRouteObserver,
        ],
      ),
    );
  }
}
''');
    }

    File routeUtilDartFile = File("$targetProjectDirectoryPath/lib/route_util.dart");
    if (routeUtilDartFile.existsSync() != true) {
      routeUtilDartFile.createSync();
      routeUtilDartFile.writeAsStringSync('''
import 'package:$targetProjectName/pages/root_page/root_page_view.dart';
import 'package:$targetProjectName/pages/splash_page/splash_page_view.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class RouteUtil {
  static String initialRoute = '/';

  static final List<GetPage> initialPages = [
    GetPage(
      name: initialRoute,
      page: () => SplashPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const RootPage().getRouteName(),
      page: () => RootPage.fromRouteParas(Get.parameters),
    ),
  ];
}
''');
    }
  }

  static void createTemplateFiles({
    required String targetProjectDirectoryPath,
  }) {
    File rootPageLogicFile = File("$targetProjectDirectoryPath/lib/pages/root_page/root_page_logic.dart");
    File rootPageStateFile = File("$targetProjectDirectoryPath/lib/pages/root_page/root_page_state.dart");
    File rootPageViewFile = File("$targetProjectDirectoryPath/lib/pages/root_page/root_page_view.dart");
    if (rootPageLogicFile.existsSync() != true) {
      rootPageLogicFile.createSync(recursive: true);
      rootPageLogicFile.writeAsStringSync('''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'root_page_state.dart';

class RootPageLogic extends BasePageGetxController<RootPageState> {
  @override
  RootPageState initBasePageBaseState() => RootPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    // TODO:如果使用到的page的参数，则需要判断page的参数是否合法，因为当前是支持动态路由的，所以无法向原生那样强制要求参数不为null
    // throw "parameter error";
    // TODO: implement loadData
    throw UnimplementedError();
  }
}
''');
    }

    if (rootPageStateFile.existsSync() != true) {
      rootPageStateFile.createSync(recursive: true);
      rootPageStateFile.writeAsStringSync('''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'root_page_view.dart';

class RootPageState extends BasePageBaseState<RootPage> {
  RootPageState() {
    ///Initialize variables
  }
}
''');
    }

    if (rootPageViewFile.existsSync() != true) {
      rootPageViewFile.createSync(recursive: true);
      rootPageViewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'root_page_logic.dart';
import 'root_page_state.dart';

class RootPage extends BasePageStatefulWidget {
  const RootPage({
    super.key,
    super.getTag,
  });

  factory RootPage.fromRouteParas(Map<String, dynamic> json) => RootPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/root";

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends BasePageState<RootPageLogic, RootPageState, RootPage> {
  @override
  RootPageLogic initGetxController() => RootPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("TODO");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, RootPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // TODO：
        ],
      ),
    );
  }
}
''');
    }

    File splashPageLogicFile = File("$targetProjectDirectoryPath/lib/pages/splash_page/splash_page_logic.dart");
    File splashPageStateFile = File("$targetProjectDirectoryPath/lib/pages/splash_page/splash_page_state.dart");
    File splashPageViewFile = File("$targetProjectDirectoryPath/lib/pages/splash_page/splash_page_view.dart");

    if (splashPageLogicFile.existsSync() != true) {
      splashPageLogicFile.createSync(recursive: true);
      splashPageLogicFile.writeAsStringSync('''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'splash_page_state.dart';

class SplashPageLogic extends BasePageGetxController<SplashPageState> {
  @override
  SplashPageState initBasePageBaseState() => SplashPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    // TODO:如果使用到的page的参数，则需要判断page的参数是否合法，因为当前是支持动态路由的，所以无法向原生那样强制要求参数不为null
    // throw "parameter error";
    // TODO: implement loadData
    throw UnimplementedError();
  }
}
''');
    }

    if (splashPageStateFile.existsSync() != true) {
      splashPageStateFile.createSync(recursive: true);
      splashPageStateFile.writeAsStringSync('''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'splash_page_view.dart';

class SplashPageState extends BasePageBaseState<SplashPage> {
  SplashPageState() {
    ///Initialize variables
  }
}
''');
    }

    if (splashPageViewFile.existsSync() != true) {
      splashPageViewFile.createSync(recursive: true);
      splashPageViewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'splash_page_logic.dart';
import 'splash_page_state.dart';

class SplashPage extends BasePageStatefulWidget {
  const SplashPage({
    super.key,
    super.getTag,
  });

  factory SplashPage.fromRouteParas(Map<String, dynamic> json) => SplashPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPageLogic, SplashPageState, SplashPage> {
  @override
  SplashPageLogic initGetxController() => SplashPageLogic();
  
  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("TODO");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, SplashPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // TODO：
        ],
      ),
    );
  }
}
''');
    }
  }

  static void makeImageAssets({
    required String targetProjectDirectoryPath,
  }) {
    var imageAssetsDirectory = Directory("$targetProjectDirectoryPath/assets/images");
    if (imageAssetsDirectory.existsSync() != true) {
      imageAssetsDirectory.createSync(recursive: true);
    }
  }

  static void makeMakers({
    required String targetProjectDirectoryPath,
  }) {
    var makersDirectory = Directory("$targetProjectDirectoryPath/_makers");
    if (makersDirectory.existsSync() != true) {
      makersDirectory.createSync(recursive: true);
    }

    var imageAssetsMakerFile = File("$targetProjectDirectoryPath/_makers/image_assets_maker.dart");
    if (imageAssetsMakerFile.existsSync() != true) {
      imageAssetsMakerFile.createSync(recursive: true);
      imageAssetsMakerFile.writeAsStringSync('''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_maker.dart';

void main() {
  ImageAssetMaker.makeImageAssetToAssetClass(
    directoryPath: "assets/images",
    targetFile: 'lib/config/app_image_asset.dart',
    className: 'AppImageAsset',
  );
}
''');
    }
  }

  /// 添加规则
  static void addLinterRules({required String targetProjectDirectoryPath}) {
    String yamlFilePath = "$targetProjectDirectoryPath/analysis_options.yaml";
    var yamlEditor = _loadPubspecYamlFile(yamlFilePath);

    /// 添加新的依赖项节点
    try {
      yamlEditor.update(["linter", "rules", "require_trailing_commas"], true);

      /// 添加新的依赖项节点
      yamlEditor.update(["linter", "rules", "prefer_const_constructors"], true);

      /// 添加新的依赖项节点
      yamlEditor.update(["linter", "rules", "unnecessary_this"], false);
    } catch (e) {
      yamlEditor.update([
        "linter",
        "rules",
      ], {
        "require_trailing_commas": true,
        "prefer_const_constructors": true,
        "unnecessary_this": false,
      });
    }

    try {
      yamlEditor.update(["formatter", "trailing_commas"], "preserve");
    } catch (e) {
      /// 添加新的依赖项节点
      yamlEditor.update([
        "formatter",
      ], {
        "trailing_commas": "preserve",
      });
    }

    File(yamlFilePath).writeAsStringSync(yamlEditor.toString());
  }

  static YamlMap _parseYamlFile(String yamFilePath) {
    var yamFile = File(yamFilePath);
    var fileContent = yamFile.readAsStringSync();
    var doc = loadYaml(fileContent);
    return doc as YamlMap;
  }

  static List<String> _readYamlFile(String yamlFilePath) {
    var yamFile = File(yamlFilePath);
    return yamFile.readAsLinesSync();
  }

  /// 加载pubspec.yaml文件
  static YamlEditor _loadPubspecYamlFile(String pubspecYamlPath) {
    var jsonString = File(pubspecYamlPath).readAsStringSync();

    final yamlEditor = YamlEditor(jsonString);
    return yamlEditor;
  }
}

// Future<void> main() async {
//   await ProjectMaker.makeProject(
//     flutterPath: "/Volumes/exmac/env/FlutterSDK/flutter_macos_arm64_3.38.6-stable/bin/flutter",
//     targetProjectDirectoryPath: "/Volumes/exmac/projects/geass_system/flutter_stock_analysis_chart",
//     packageName: "org.geass.flutter_stock_analysis_chart",
//     needGit: false,
//   );
// }
