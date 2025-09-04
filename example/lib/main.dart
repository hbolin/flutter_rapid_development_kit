import 'package:example/route_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BasePageGlobalConfig(
      // defaultAppBarBackButton: AppBarBackButton(),
      // defaultAppBarBackButtonBuilder: GestureDetector(
      //     behavior: HitTestBehavior.opaque,
      //     onTap: () {
      //       LogUtil.debug("点击返回按钮");
      //       Navigator.of(context).pop();
      //     },
      //     child: Text("点击返回")),
      defaultAppBarBackButtonBuilder: (BuildContext context) {
        // return AppBarBackButton();
        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              LogUtil.debug("点击返回按钮");
              Navigator.of(context).pop();
            },
            child: Text("点击返回"));
      },
      defaultLoadingWidgetBuilder: (BuildContext context, bool isPage, Widget appBarBackButton, Widget? appBarTitle) {
        return BasePageDefaultLoadingWidget(
          isPage: isPage,
          appBarBackButton: appBarBackButton,
          appBarTitle: appBarTitle,
          defaultLoadingWidget: Center(child: Text("加载中")),
        );
      },
      defaultErrorWidgetBuilder:
          (BuildContext context, bool isPage, Widget appBarBackButton, Widget? appBarTitle, CachedLoadingBodyController controller, error) {
        return BasePageDefaultErrorWidget(
          isPage: isPage,
          appBarBackButton: appBarBackButton,
          appBarTitle: appBarTitle,
          controller: controller,
          error: error,
          defaultErrorWidget: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              controller.reloadData();
            },
            child: Center(
              child: Text(
                "加载错误:$error", // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        );
      },
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
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            // brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        navigatorObservers: <RouteObserver<ModalRoute<void>>>[
          frdkRouteObserver,
        ],
        initialRoute: RouteUtil.initialRoute,
        getPages: RouteUtil.initialPages,
      ),
    );
  }
}
