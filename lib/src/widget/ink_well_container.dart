import 'package:flutter/material.dart';

/// 波纹的容器
/// https://zhuanlan.zhihu.com/p/638230689
/// Ink 的作用就是为了方便使用 InkWell 的点击效果而存在， 你可以把 Container 上的 color 、decoration 等配置挪到 Ink 上从而解决 Material 的点击效果被遮挡的问题。
class InkWellContainer extends Container {
  /// 背景颜色
  final Color? _overrideColor;

  /// margin
  final EdgeInsetsGeometry? _overrideMargin;

  /// 圆角
  final BorderRadius? _overrideBorderRadius;

  /// 圆角
  final double? radius;

  /// 边框颜色
  final Color? borderColor;

  /// 边框尺寸
  final double borderWidth;

  /// 点击
  final GestureTapCallback? onTap;

  InkWellContainer({
    super.key,
    super.alignment,
    super.padding,
    Color? color,
    this.radius,
    this.borderColor,
    this.borderWidth = 1,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    EdgeInsetsGeometry? margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,
    BorderRadius? borderRadius,
  })  : _overrideColor = color,
        _overrideMargin = margin,
        _overrideBorderRadius = borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget current = super.build(context);

    BorderRadius? inkBorderRadius = _overrideBorderRadius;
    if (inkBorderRadius == null && radius != null) {
      inkBorderRadius = BorderRadius.circular(radius!);
    }

    Border? inkBorder;
    if (borderColor != null) {
      inkBorder = Border.all(
        color: borderColor!,
        width: borderWidth,
      );
    }

    BorderRadius? inkWellBorderRadius;
    if (radius != null) {
      if (borderColor != null) {
        inkWellBorderRadius = BorderRadius.circular((radius! > borderWidth) ? (radius! - borderWidth) : 0);
      } else {
        inkWellBorderRadius = BorderRadius.circular(radius!);
      }
    }

    current = Ink(
      decoration: BoxDecoration(
        color: _overrideColor,
        borderRadius: inkBorderRadius,
        border: inkBorder,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: inkWellBorderRadius,
        child: current,
      ),
    );

    if (_overrideMargin != null) {
      current = Padding(
        padding: _overrideMargin,
        child: current,
      );
    }

    return current;
  }
}
