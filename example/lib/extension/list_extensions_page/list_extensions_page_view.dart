import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'list_extensions_page_logic.dart';
import 'list_extensions_page_state.dart';

class ListExtensionsPage extends BasePageStatefulWidget {
  const ListExtensionsPage({
    super.key,
    super.getTag,
  });

  factory ListExtensionsPage.fromRouteParas(Map<String, dynamic> json) => ListExtensionsPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/list_extensions";

  @override
  State<ListExtensionsPage> createState() => _ListExtensionsPageState();
}

class _ListExtensionsPageState extends BasePageState<ListExtensionsPageLogic, ListExtensionsPageState, ListExtensionsPage> {
  @override
  ListExtensionsPageLogic initGetxController() => ListExtensionsPageLogic();

  @override
  Widget buildScaffold(BuildContext context, ListExtensionsPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(state.result),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                var list_3 = state.list_1.union(state.list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  state.result = "state.list_1:${state.list_1}\nstate.list_2:${state.list_2}\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.union"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                var list_3 = state.list_1.subtract(state.list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  state.result = "state.list_1:${state.list_1}\nstate.list_2:${state.list_2}\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.subtract"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                var list_3 = state.list_1.intersect(state.list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  state.result = "state.list_1:${state.list_1}\nstate.list_2:${state.list_2}\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.intersect"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                setState(() {
                  state.result = "state.list_1:${state.list_1.indexOrNull(2)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(2)"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                setState(() {
                  state.result = "state.list_1:${state.list_1.indexOrNull(-1)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(-1)"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                setState(() {
                  state.result = "state.list_1:${state.list_1.indexOrNull(0)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(0)"),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {
                setState(() {
                  state.result = "state.list_1:${state.list_1.indexOrNull(10)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(10)"),
            ),
          ],
        ),
      ),
    );
  }
}
