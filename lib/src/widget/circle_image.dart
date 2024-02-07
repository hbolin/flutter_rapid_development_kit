import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 圆形图片
class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxFit boxFit;
  final Color? borderColor;
  final double borderWidth;
  final Widget? placeholder;
  final Widget errorWidget;
  final Color? backgroundColor;

  const CircleImage({
    Key? key,
    required this.imageUrl,
    required this.size,
    this.boxFit = BoxFit.cover,
    this.borderColor,
    this.borderWidth = 1.0,
    this.placeholder,
    this.errorWidget = const SizedBox.shrink(),
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      placeholder: placeholder == null ? null : ((context, url) => placeholder!),
      errorWidget: (context, url, error) => errorWidget,
      // 这里有imageBuilder属性可以配置圆形，但是不符合设计要求
    );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: borderColor == null
            ? null
            : Border.all(
                width: borderWidth,
                color: borderColor!,
              ),
      ),
      child: ClipOval(
        child: child,
      ),
    );
  }
}
