import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 加载中的工具类，一般用来用户动作类型的处理
class LoadingUtil {
  static bool _isShow = false;

  /// 模态展示，不允许用户关闭，只能有程序控制关闭
  static void showDialog(BuildContext context, {bool? isDark}) {
    isDark ??= Theme.of(context).brightness == Brightness.dark;
    if (!_isShow) {
      _isShow = true;
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
            child: Align(
              alignment: Alignment.center,
              child: _LoadingDialog(
                isDark: isDark ?? false,
              ),
            ),
          );
        },
      ).then((_) {
        _isShow = false;
      }).catchError((e, s) {
        _isShow = false;
      });
    }
  }

  static void dismissDialog(BuildContext context) {
    if (_isShow) {
      Navigator.of(context).pop();
    }
  }
}

class _LoadingDialog extends StatelessWidget {
  final bool isDark;

  const _LoadingDialog({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isDark ? Colors.white12 : Colors.black54,
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
