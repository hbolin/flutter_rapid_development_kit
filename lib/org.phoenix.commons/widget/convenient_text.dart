import 'package:flutter/material.dart';

/// 便利性字体，一般文字就设置一些
/// [color]
/// [fontSize]
/// [fontWeight]
class ConvenientText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const ConvenientText(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
