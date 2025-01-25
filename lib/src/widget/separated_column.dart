import 'package:flutter/material.dart';

/// 分割Column
class SeparatedColumn extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets padding;

  const SeparatedColumn({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount <= 0) {
      return const SizedBox.shrink(); // 返回一个占位符
    }

    var topPadding = padding.top;
    var bottomPadding = padding.bottom;

    List<Widget> children = [];
    for (int i = 0; i < itemCount; i++) {
      if (i != (itemCount - 1)) {
        children.add(itemBuilder(context, i));
        children.add(separatorBuilder(context, i));
      } else {
        children.add(itemBuilder(context, i));
      }
    }

    if (topPadding != 0) {
      children.insert(0, SizedBox(height: topPadding));
    }
    if (bottomPadding != 0) {
      children.add(SizedBox(height: bottomPadding));
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
