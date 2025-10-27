import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/util/log_util.dart';
import 'package:get/get.dart';

/// 加载中的工具类，一般用来用户动作类型的处理
class LoadingUtil {
  const LoadingUtil._();

  static OverlayEntry? overlayEntry;

  /// 模态展示，不允许用户关闭，只能有程序控制关闭
  static void showDialog({bool? isDark}) {
    // Remove the existing OverlayEntry.
    dismissDialog();

    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return Stack(
          children: [
            // 为了防止背景会被点击
            Container(color: Colors.transparent),
            SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: _LoadingDialog(
                  isDark: isDark ?? Get.isDarkMode,
                ),
              ),
            ),
          ],
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    assert(Get.overlayContext != null);
    if (Get.overlayContext != null) {
      Overlay.of(Get.overlayContext!).insert(overlayEntry!);
    }
  }

  static void dismissDialog() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  static bool isShowing() {
    return overlayEntry != null;
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

/// 显示loading的时候，不允许按返回键返回
class LoadingUtilListener extends StatelessWidget {
  final Widget child;

  const LoadingUtilListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        LogUtil.debug("LoadingUtilListener didPop:$didPop result:$result");
        if (didPop) {
          return;
        }
        if (LoadingUtil.isShowing() != true) {
          Navigator.of(context).pop(result);
        }
      },
      child: child,
    );
  }
}
