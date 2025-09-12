import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// “加载中”的组件实现
class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: 12,
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFFEBEBF5) : const Color(0xFF3C3C44),
      ),
    );
  }
}
