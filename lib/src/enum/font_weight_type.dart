import 'package:flutter/material.dart';

/// 字体粗细
/// 通常情况下，使用regular，semibold即可，当然默认情况下都是使用regular，需要加粗就使用semibold
enum FontWeightType {
  /// 细体（不推荐使用，请使用 regular 或 semibold）
  @Deprecated("请使用 regular 或 semibold")
  light(fontWeight: FontWeight.w300),

  /// 常规
  regular(fontWeight: FontWeight.w400),

  /// 中等（不推荐使用，请使用 regular 或 semibold）
  @Deprecated("请使用 regular 或 semibold")
  medium(fontWeight: FontWeight.w500),

  /// 半粗
  semibold(fontWeight: FontWeight.w600);

  const FontWeightType({
    required this.fontWeight,
  });

  /// 字体类型
  final FontWeight fontWeight;
}
