import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 加载中的工具类，一般用来用户动作类型的处理
class LoadingDialogUtil {
  static bool isShow = false;

  /// 模态展示，不允许用户关闭，只能有程序控制关闭
  static void show(BuildContext context) {
    if (!isShow) {
      isShow = true;
      showGeneralDialog(
        context: context,
        barrierDismissible: false, // 是否能通过点击空白处关闭
        barrierColor: Colors.transparent, // 背景色
        // transitionDuration: const Duration(milliseconds: 150), // 动画时长
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Align(
              alignment: Alignment.center,
              child: _LoadingDialogContent(),
            ),
          );
        },
      ).then((_) {
        isShow = false;
      }).catchError((e, s) {
        isShow = false;
      });
    }
  }

  static void dismiss(BuildContext context) {
    if (isShow) {
      Navigator.of(context).pop();
    }
  }
}

class _LoadingDialogContent extends StatelessWidget {
  const _LoadingDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: () {
          return switch (Theme.of(context).brightness) {
            Brightness.dark => Colors.white12,
            Brightness.light => Colors.black54,
          };
        }(),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Theme(
        data: ThemeData(
          cupertinoOverrideTheme: const CupertinoThemeData(
            brightness: Brightness.dark,
          ),
        ),
        child: const CupertinoActivityIndicator(
          radius: 12,
        ),
      ),
    );
  }
}
