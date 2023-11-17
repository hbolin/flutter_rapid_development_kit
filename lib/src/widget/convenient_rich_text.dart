import 'package:flutter/gestures.dart';
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
        style: TextStyle(
          color: dataList.firstOrNull?.color,
          fontSize: dataList.firstOrNull?.fontSize,
          fontWeight: dataList.firstOrNull?.fontWeight,
          fontStyle: dataList.firstOrNull?.fontStyle,
        ),
        children: children,
        recognizer: dataList.firstOrNull?.onTap != null
            ? () {
                return TapGestureRecognizer()..onTap = dataList.firstOrNull?.onTap;
              }()
            : null,
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
  final GestureTapCallback? onTap;

  ConvenientRichTextData({
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
    this.fontStyle,
    this.onTap,
  });
}

class ConvenientRichText2 extends StatelessWidget {
  final List<ConvenientRichTextData2> dataList;

  const ConvenientRichText2({
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
                return TapGestureRecognizer()..onTap = dataList.firstOrNull?.onTap;
              }()
            : null,
      ),
    );
  }
}

class ConvenientRichTextData2 {
  final String text;
  final TextStyle textStyle;
  final GestureTapCallback? onTap;

  ConvenientRichTextData2({
    required this.text,
    required this.textStyle,
    this.onTap,
  });
}
