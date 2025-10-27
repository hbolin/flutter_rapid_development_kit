import 'package:example/util/shared_preferences_util_page/models/GlobalAppInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'shared_preferences_util_page_logic.dart';
import 'shared_preferences_util_page_state.dart';

class SharedPreferencesUtilPage extends BasePageStatefulWidget {
  const SharedPreferencesUtilPage({
    super.key,
    super.getTag,
  });

  factory SharedPreferencesUtilPage.fromRouteParas(Map<String, dynamic> json) => SharedPreferencesUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/shared_preferences_util";

  @override
  State<SharedPreferencesUtilPage> createState() => _SharedPreferencesUtilPageState();
}

class _SharedPreferencesUtilPageState extends BasePageState<SharedPreferencesUtilPageLogic, SharedPreferencesUtilPageState, SharedPreferencesUtilPage> {
  @override
  SharedPreferencesUtilPageLogic initGetxController() => SharedPreferencesUtilPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("SharedPreferencesUtil");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, SharedPreferencesUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Text("isFirstInstall：${state.globalAppInfo?.isFirstInstall}"),
          Switch(
            value: state.globalAppInfo?.isFirstInstall ?? false,
            onChanged: (value) async {
              setState(() {
                state.globalAppInfo!.isFirstInstall = value;
              });
              await SharedPreferencesUtil.setSerializable("key", state.globalAppInfo!);
              print(state.globalAppInfo!.writeObjectToJsonString());
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              var globalAppInfo = await SharedPreferencesUtil.getSerializable("key", GlobalAppInfo());
              LogUtil.debug("globalAppInfo:$globalAppInfo");
              ToastUtil.show("${globalAppInfo?.isFirstInstall}");
              // final snackBar = SnackBar(content: Text("${globalAppInfo?.isFirstInstall}"));
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text("SharedPreferencesUtil.getSerializable"),
          ),
        ],
      ),
    );
  }
}
