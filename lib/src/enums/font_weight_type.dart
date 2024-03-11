import 'package:flutter/material.dart';

/// 字体粗细
enum FontWeightType {
  /// light 细体
  light(fontWeight: FontWeight.w300, devDescription: "细体"),

  /// regular 常规
  regular(fontWeight: FontWeight.w400, devDescription: "常规"),

  /// medium 中等
  medium(fontWeight: FontWeight.w500, devDescription: "中等"),

  /// semibold 半粗
  semibold(fontWeight: FontWeight.w600, devDescription: "半粗");

  const FontWeightType({
    required this.fontWeight,
    required this.devDescription,
  });

  /// 字体类型
  final FontWeight fontWeight;

  /// 开发阶段的描述
  final String devDescription;
}
