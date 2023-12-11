import 'package:flutter/material.dart';

/// 分割Wrap
class SeparatedWrap extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final double spacing;
  final double runSpacing;

  const SeparatedWrap({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < itemCount; i++) {
      if (i != (itemCount - 1)) {
        children.add(itemBuilder(context, i));
        children.add(separatorBuilder(context, i));
      } else {
        children.add(itemBuilder(context, i));
      }
    }

    return Wrap(
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
    );
  }
}
