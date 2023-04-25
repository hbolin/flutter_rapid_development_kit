import 'package:flutter/material.dart';

/// 波纹的容器
class InkWellContainer extends Container {
  final Color? customColor;
  final EdgeInsetsGeometry? customMargin;
  final double? radius;
  final Color? borderColor;
  final double borderWidth;
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
  })  : this.customColor = color,
        this.customMargin = margin;

  @override
  Widget build(BuildContext context) {
    Widget current = super.build(context);

    BorderRadius? inkBorderRadius;
    if (radius != null) {
      inkBorderRadius = BorderRadius.circular(radius!);
    }

    Border? inkBorder;
    if (borderColor != null) {
      inkBorder = Border.all(color: borderColor!, width: borderWidth);
    }

    BorderRadius? inkWellBorderRadius;
    if (radius != null) {
      if (borderColor != null) {
        inkWellBorderRadius = BorderRadius.circular(radius! - borderWidth);
      } else {
        inkWellBorderRadius = BorderRadius.circular(radius!);
      }
    }

    current = Ink(
      decoration: BoxDecoration(
        color: customColor,
        borderRadius: inkBorderRadius,
        border: inkBorder,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: inkWellBorderRadius,
        child: current,
      ),
    );

    if (customMargin != null) {
      current = Padding(
        padding: customMargin!,
        child: current,
      );
    }

    return current;
  }
}
