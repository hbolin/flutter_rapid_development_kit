import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ConvenientRichText extends StatelessWidget {
  final List<ConvenientRichTextData> dataList;

  const ConvenientRichText({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> children = dataList
        .skip(1)
        .map(
          (e) => TextSpan(
            text: e.text,
            style: TextStyle(
              color: e.color,
              fontSize: e.fontSize,
              fontWeight: e.fontWeight,
              fontStyle: e.fontStyle,
            ),
          ),
        )
        .toList();

    return RichText(
      text: TextSpan(
        text: dataList.firstOrNull?.text ?? "",
        style: TextStyle(
          color: dataList.firstOrNull?.color,
          fontSize: dataList.firstOrNull?.fontSize,
          fontWeight: dataList.firstOrNull?.fontWeight,
          fontStyle: dataList.firstOrNull?.fontStyle,
        ),
        children: children,
      ),
    );
  }
}

class ConvenientRichTextData {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  ConvenientRichTextData({
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
    this.fontStyle,
  });
}
