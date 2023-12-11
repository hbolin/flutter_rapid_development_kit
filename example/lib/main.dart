import 'package:example/utils/route_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// /Users/zhangwu/development/flutter_sdk/flutter_macos_arm64_3.16.3-stable/bin/flutter run -d web-server --web-hostname 192.168.1.89 --web-port 9090 --web-renderer html
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteUtil.initialRoute,
      getPages: RouteUtil.initPages,
    );
  }
}
