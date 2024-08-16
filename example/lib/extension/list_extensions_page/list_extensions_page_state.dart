import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'list_extensions_page_view.dart';

class ListExtensionsPageState extends BasePageBaseState<ListExtensionsPage> {
  ListExtensionsPageState() {
    ///Initialize variables
  }

  List<Model> list_1 = [];
  List<Model> list_2 = [];

  String result = "";
}

class Model {
  final int index;
  final String name;

  Model(this.index, this.name);

  @override
  String toString() {
    return '_Model{index: $index, name: $name, hashCode:$hashCode}\n';
  }
}
