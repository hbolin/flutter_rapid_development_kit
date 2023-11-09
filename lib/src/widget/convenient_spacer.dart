import 'package:flutter/material.dart';

/// 便利性间隔
class ConvenientSpacer extends StatelessWidget {
  final int? flex;
  final double? vertical;
  final double? horizontal;
  final _ConvenientSpacerType _type;

  const ConvenientSpacer({
    Key? key,
    this.flex,
  })  : _type = _ConvenientSpacerType.flex,
        horizontal = null,
        vertical = null,
        super(key: key);

  const ConvenientSpacer.vertical({Key? key, required double this.vertical})
      : _type = _ConvenientSpacerType.size,
        flex = null,
        horizontal = null,
        super(key: key);

  const ConvenientSpacer.horizontal({
    Key? key,
    required double this.horizontal,
  })  : _type = _ConvenientSpacerType.size,
        flex = null,
        vertical = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_type) {
      case _ConvenientSpacerType.flex:
        child = Spacer(flex: flex!);
        break;
      case _ConvenientSpacerType.size:
        child = SizedBox(width: horizontal, height: vertical);
        break;
    }
    return child;
  }
}

enum _ConvenientSpacerType {
  flex,
  size,
}
