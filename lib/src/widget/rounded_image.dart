import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 圆角图片
class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  final BoxFit boxFit;
  final Color? borderColor;
  final double borderWidth;
  final Widget? placeholder;
  final Widget errorWidget;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Color? backgroundColor;
  final BorderRadiusGeometry? customBorderRadius;

  const RoundedImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.radius,
    this.boxFit = BoxFit.cover,
    this.borderColor,
    this.borderWidth = 1.0,
    this.placeholder,
    this.errorWidget = const SizedBox.shrink(),
    this.color,
    this.colorBlendMode,
    this.backgroundColor,

    /// 自定义borderRadius，如果有配置该值，则[radius]属性会被覆盖
    this.customBorderRadius,
  }) : super(key: key);

  const RoundedImage.zero({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.boxFit = BoxFit.cover,
    this.borderColor,
    this.borderWidth = 1.0,
    this.placeholder,
    this.errorWidget = const SizedBox.shrink(),
    this.color,
    this.colorBlendMode,
    this.backgroundColor,

    /// 自定义borderRadius，如果有配置该值，则[radius]属性会被覆盖
    this.customBorderRadius,
  })  : radius = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      placeholder: placeholder == null ? null : ((context, url) => placeholder!),
      errorWidget: (context, url, error) => errorWidget,
      color: color,
      colorBlendMode: colorBlendMode,
      // 这里有imageBuilder属性可以配置圆形，但是不符合设计要求
    );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: customBorderRadius ?? BorderRadius.circular(radius + borderWidth),
        border: borderColor == null
            ? null
            : Border.all(
                width: borderWidth,
                color: borderColor!,
              ),
      ),
      child: ClipRRect(
        borderRadius: customBorderRadius ?? BorderRadius.circular(radius),
        child: child,
      ),
    );
  }
}
