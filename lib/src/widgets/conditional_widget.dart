import 'package:flutter/material.dart';

/// 条件判断，虽然三元表达式也可以实现响应的功能，
/// 但是flutter中一切都是widget，那么条件判断也封装成组件的话，会比较优雅。
class ConditionalWidget extends StatelessWidget {
  final bool isSuccess;
  final Widget successWidget;
  final Widget failureWidget;

  const ConditionalWidget({
    Key? key,
    required this.isSuccess,
    required this.successWidget,
    required this.failureWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSuccess ? successWidget : failureWidget;
  }
}

/// 条件判断
/// 为什么使用WidgetBuilder？
/// 因为如果使用ConditionalWidget的话，successWidget和failureWidget会初始化，如果有些数据不正确的话，导致报错，虽然不参与渲染。
class ConditionalBuilder extends StatelessWidget {
  final bool isSuccess;
  final WidgetBuilder successBuilder;
  final WidgetBuilder failureBuilder;

  const ConditionalBuilder({
    Key? key,
    required this.isSuccess,
    required this.successBuilder,
    required this.failureBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSuccess ? successBuilder(context) : failureBuilder(context);
  }
}
