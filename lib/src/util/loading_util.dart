import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 加载中的工具类，一般用来用户动作类型的处理
class LoadingUtil {
  const LoadingUtil._();

  static RawDialogRoute? _loadingDialogRawDialogRoute;

  /// 模态展示，不允许用户关闭，只能有程序控制关闭
  static void showDialog({bool? isDark}) {
    assert(Get.context != null, "无法获取到Get.context");
    isDark ??= Theme.of(Get.context!).brightness == Brightness.dark;
    if (_loadingDialogRawDialogRoute == null) {
      _showGeneralDialog(
        context: Get.context!,
        barrierDismissible: false, // 是否能通过点击空白处关闭
        barrierColor: Colors.transparent, // 背景色
        // transitionDuration: const Duration(milliseconds: 150), // 动画时长
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return PopScope(
            canPop: false,
            child: Align(
              alignment: Alignment.center,
              child: _LoadingDialog(
                isDark: isDark ?? false,
              ),
            ),
          );
        },
        onRawDialogRouteCreated: (RawDialogRoute rawDialogRoute) {
          _loadingDialogRawDialogRoute = rawDialogRoute;
        },
      ).then((_) {
        _loadingDialogRawDialogRoute = null;
      }).catchError((e, s) {
        _loadingDialogRawDialogRoute = null;
      });
    }
  }

  /// 关闭对话框
  static void dismissDialog() {
    assert(Get.context != null, "无法获取到Get.context");
    if (_loadingDialogRawDialogRoute != null) {
      Navigator.removeRoute(Get.context!, _loadingDialogRawDialogRoute!);
    }
  }

  /// 是否在展示中
  static bool isShowing() {
    return _loadingDialogRawDialogRoute != null;
  }

  static Future<T?> _showGeneralDialog<T extends Object?>({
    required BuildContext context,
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    bool fullscreenDialog = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    bool? requestFocus,
    required void Function(RawDialogRoute<T> rawDialogRoute) onRawDialogRouteCreated,
  }) {
    assert(!barrierDismissible || barrierLabel != null);
    RawDialogRoute<T> rawDialogRoute = RawDialogRoute<T>(
      pageBuilder: pageBuilder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      requestFocus: requestFocus,
      fullscreenDialog: fullscreenDialog,
    );
    onRawDialogRouteCreated(rawDialogRoute);
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(rawDialogRoute);
  }
}

class _LoadingDialog extends StatelessWidget {
  final bool isDark;

  const _LoadingDialog({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff2c292f) : Colors.black54,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: CupertinoActivityIndicator(
        radius: 12,
        color: isDark ? const Color(0xFFEBEBF5) : const Color(0xFFEBEBF5),
      ),
    );
  }
}
