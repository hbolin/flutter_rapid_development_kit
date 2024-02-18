import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/widget/separated_column.dart';

/// 使用Column和Row来模拟GridView，这样子高度可以自适应高度
/// 类似的组件[ListGridView]
class ColumnRowGridView extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder horizontalSeparatorBuilder;
  final IndexedWidgetBuilder verticalSeparatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const ColumnRowGridView({
    Key? key,
    required this.itemCount,
    required this.crossAxisCount,
    required this.itemBuilder,
    required this.horizontalSeparatorBuilder,
    required this.verticalSeparatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lines = itemCount ~/ crossAxisCount;
    var leftCount = itemCount % crossAxisCount;

    return SeparatedColumn(
      itemBuilder: (build, index) {
        List<Widget> children = [];
        if (index < lines) {
          int min = crossAxisCount * index;
          int max = crossAxisCount * (index + 1);
          for (int i = min; i < max; i++) {
            if (i != (max - 1)) {
              children.add(Expanded(child: itemBuilder(context, i)));
              children.add(horizontalSeparatorBuilder(context, i));
            } else {
              children.add(Expanded(child: itemBuilder(context, i)));
            }
          }
        } else {
          int min = crossAxisCount * index;
          int max = crossAxisCount * (index + 1);
          int readMax = crossAxisCount * index + leftCount;
          for (int i = min; i < max; i++) {
            if (i != (max - 1)) {
              if (i >= readMax) {
                children.add(const Expanded(child: SizedBox.shrink()));
              } else {
                children.add(Expanded(child: itemBuilder(context, i)));
              }
              children.add(horizontalSeparatorBuilder(context, i));
            } else {
              children.add(const Expanded(child: SizedBox.shrink()));
            }
          }
        }
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        );
      },
      separatorBuilder: verticalSeparatorBuilder,
      itemCount: lines + (leftCount == 0 ? 0 : 1),
    );
  }
}
