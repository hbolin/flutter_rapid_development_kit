import 'package:flutter/material.dart';

/// 便捷的Container
class ConvenientContainer extends Container {
  final GestureTapCallback? onTap;

  ///  圆角，需设置圆角半径[radius]
  ConvenientContainer.round({
    super.key,
    super.alignment,
    super.padding,
    Color? color,
    required double radius,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,
  }) : super(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        );

  /// 设置边框颜色
  ConvenientContainer.border({
    super.key,
    super.alignment,
    super.padding,
    Color? color,
    required Color borderColor,
    double borderWidth = 1,
    double radius = 0,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,
  }) : super(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        );

  /// 渐变色，仅支持 [Axis.horizontal] 和 [Axis.vertical] 方向
  /// 需要支持其他方向，还是使用[Container]来完成
  ConvenientContainer.linearGradient({
    super.key,
    super.alignment,
    super.padding,
    Axis gradientAxis = Axis.horizontal,
    required List<Color> gradientColors,
    super.foregroundDecoration,
    super.width,
    super.height,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,
  }) : super(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: gradientAxis == Axis.horizontal ? Alignment.centerLeft : Alignment.topCenter,
              end: gradientAxis == Axis.horizontal ? Alignment.centerRight : Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
        );

  /// 设置最小的宽高
  ConvenientContainer.minWidthHeight({
    super.key,
    super.alignment,
    super.padding,
    super.color,
    super.decoration,
    super.foregroundDecoration,
    super.width,
    super.height,
    required double minWidth,
    required double minHeight,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,
  }) : super(
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: minHeight,
          ),
        );

  /// 支持设置以上所有效果的快捷设置
  ConvenientContainer.convenient({
    super.key,
    super.alignment,
    super.padding,
    Color? color,
    Color? borderColor,
    double borderWidth = 1,
    double? radius,
    Axis? gradientAxis,
    List<Color>? gradientColors,
    super.foregroundDecoration,
    super.width,
    super.height,
    double? minWidth,
    double? minHeight,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior = Clip.none,
    this.onTap,

    /// 自定义borderRadius，如果有配置该值，则[radius]属性会被覆盖
    BorderRadiusGeometry? customBorderRadius,
  }) : super(
          decoration: BoxDecoration(
            color: color,
            border: borderColor != null
                ? Border.all(
                    color: borderColor,
                    width: borderWidth,
                  )
                : null,
            borderRadius: customBorderRadius ??
                (radius != null
                    ? BorderRadius.circular(
                        radius,
                      )
                    : null),
            gradient: gradientColors != null
                ? LinearGradient(
                    begin: gradientAxis == Axis.horizontal ? Alignment.centerLeft : Alignment.topCenter,
                    end: gradientAxis == Axis.horizontal ? Alignment.centerRight : Alignment.bottomCenter,
                    colors: gradientColors,
                  )
                : null,
          ),
          constraints: minWidth != null && minHeight != null
              ? BoxConstraints(
                  minWidth: minWidth,
                  minHeight: minHeight,
                )
              : null,
        );

  @override
  Widget build(BuildContext context) {
    Widget current = super.build(context);

    if (onTap != null) {
      current = GestureDetector(
        onTap: onTap,
        child: current,
      );
    }

    return current;
  }
}
