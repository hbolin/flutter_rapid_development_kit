import 'package:flutter/material.dart';

/// 分割Row
class SeparatedRow extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const SeparatedRow({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount <= 0) {
      return const SizedBox.shrink(); // 返回一个占位符
    }

    List<Widget> children = [];
    for (int i = 0; i < itemCount; i++) {
      if (i != (itemCount - 1)) {
        children.add(itemBuilder(context, i));
        children.add(separatorBuilder(context, i));
      } else {
        children.add(itemBuilder(context, i));
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
