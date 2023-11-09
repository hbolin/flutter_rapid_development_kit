import 'package:flutter/material.dart';

/// 只有在真正可见的时候，才去初始化和渲染builder组件。
/// 说明：如果只是使用Visibility组件，其中的child其实有执行初始化的工作。
class VisibilityBuilder extends StatelessWidget {
  final bool visible;
  final Widget Function(BuildContext context) builder;
  final Widget replacement;

  const VisibilityBuilder({
    Key? key,
    required this.visible,
    required this.builder,
    this.replacement = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible ? builder(context) : replacement;
  }
}
