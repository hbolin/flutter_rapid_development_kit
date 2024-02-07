import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

/// 便捷处理富文本
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
            style: e.textStyle,
            recognizer: e.onTap != null
                ? () {
                    return TapGestureRecognizer()..onTap = e.onTap;
                  }()
                : null,
          ),
        )
        .toList();

    return RichText(
      text: TextSpan(
        text: dataList.firstOrNull?.text ?? "",
        style: dataList.firstOrNull?.textStyle,
        children: children,
        recognizer: dataList.firstOrNull?.onTap != null
            ? () {
                return TapGestureRecognizer()..onTap = dataList.first.onTap;
              }()
            : null,
      ),
    );
  }
}

class ConvenientRichTextData {
  final String text;
  final TextStyle textStyle;
  final GestureTapCallback? onTap;

  ConvenientRichTextData({
    required this.text,
    required this.textStyle,
    this.onTap,
  });
}
