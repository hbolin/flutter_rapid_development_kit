import 'package:flutter/material.dart';

/// “错误”的组件实现
class DefaultErrorWidget extends StatelessWidget {
  final String error;
  final GestureTapCallback onTap;

  const DefaultErrorWidget({
    super.key,
    required this.error,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Center(
        child: Text(
          error, // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
