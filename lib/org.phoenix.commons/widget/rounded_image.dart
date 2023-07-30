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
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

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
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      placeholder: placeholder == null ? null : ((context, url) => placeholder!),
      errorWidget: (context, url, error) => errorWidget,
      color: color,
      // 这里有imageBuilder属性可以配置圆形，但是不符合设计要求
    );

    if (borderColor != null) {
      current = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius + borderWidth),
          border: Border.all(width: borderWidth, color: borderColor!),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: current,
        ),
      );
    } else {
      current = SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          child: current,
        ),
      );
    }
    return current;
  }
}
