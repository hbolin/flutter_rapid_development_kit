import 'package:flutter/material.dart';

/// 字体粗细
/// 通常情况下，使用regular，semibold即可，当然默认情况下都是使用regular，
/// 所以只有特殊情况下，才会额外设置semibold
enum FontWeightType {
  /// light 细体
  @Deprecated("使用regular/semibold即可")
  light(fontWeight: FontWeight.w300, devDescription: "细体"),

  /// regular 常规
  regular(fontWeight: FontWeight.w400, devDescription: "常规"),

  /// medium 中等
  @Deprecated("使用regular/semibold即可")
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
