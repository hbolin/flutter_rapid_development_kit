import 'package:flutter/cupertino.dart';

/// “加载中”的组件实现
class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }
}
