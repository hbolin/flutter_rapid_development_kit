import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VisibilityBuilder Widget Tests', () {
    testWidgets('should render builder when visible is true', (WidgetTester tester) async {
      const testKey = Key('testKey');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VisibilityBuilder(
              visible: true,
              builder: (context) => const Text('Visible', key: testKey),
            ),
          ),
        ),
      );

      // 验证是否渲染了 builder 返回的组件
      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text('Visible'), findsOneWidget);
    });

    testWidgets('should render replacement when visible is false', (WidgetTester tester) async {
      const testKey = Key('testKey');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VisibilityBuilder(
              visible: false,
              builder: (context) => const Text('Visible'),
              replacement: const SizedBox.shrink(key: testKey),
            ),
          ),
        ),
      );

      // 验证是否渲染了 replacement 组件
      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text('Visible'), findsNothing);
    });

    testWidgets('should render default replacement when visible is false and replacement is not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VisibilityBuilder(
              visible: false,
              builder: (context) => const Text('Visible'),
            ),
          ),
        ),
      );

      // 验证是否渲染了默认的 replacement（SizedBox.shrink）
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.text('Visible'), findsNothing);
    });

    testWidgets('should rebuild when visible changes', (WidgetTester tester) async {
      const testKey = Key('testKey');
      bool visible = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    VisibilityBuilder(
                      visible: visible,
                      builder: (context) => const Text('Visible', key: testKey),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          visible = false; // 更新 visible 并触发重新构建
                        });
                      },
                      child: const Text('Toggle Visibility'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // 初始状态为 visible=true，验证是否渲染了 builder 返回的组件
      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text('Visible'), findsOneWidget);

      // 点击按钮，更新 visible 为 false
      await tester.tap(find.text('Toggle Visibility'));
      await tester.pump();

      // 验证是否不再渲染 builder 返回的组件
      expect(find.byKey(testKey), findsNothing);
      expect(find.text('Visible'), findsNothing);
    });
  });
}
