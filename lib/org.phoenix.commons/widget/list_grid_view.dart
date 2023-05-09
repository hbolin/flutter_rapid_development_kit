import 'package:flutter/material.dart';

/// 使用ListView来模拟GridView，这样子高度可以自适应高度
class ListGridView extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder horizontalSeparatorBuilder;
  final IndexedWidgetBuilder verticalSeparatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const ListGridView({
    Key? key,
    required this.itemCount,
    required this.crossAxisCount,
    required this.itemBuilder,
    required this.horizontalSeparatorBuilder,
    required this.verticalSeparatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lines = itemCount ~/ crossAxisCount;
    var leftCount = itemCount % crossAxisCount;

    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
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

ListView buildListGridView({
  required BuildContext context,
  required int itemCount,
  required int crossAxisCount,
  required IndexedWidgetBuilder itemBuilder,
  required IndexedWidgetBuilder horizontalSeparatorBuilder,
  required IndexedWidgetBuilder verticalSeparatorBuilder,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  bool shrinkWrap = false,
  ScrollPhysics? physics,
  EdgeInsetsGeometry? padding,
}) {
  var lines = itemCount ~/ crossAxisCount;
  var leftCount = itemCount % crossAxisCount;

  return ListView.separated(
    shrinkWrap: shrinkWrap,
    physics: physics,
    padding: padding,
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
