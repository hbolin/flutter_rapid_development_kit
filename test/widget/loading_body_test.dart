import 'dart:async';

import 'package:checks/checks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/widget/loading_body.dart';
import 'package:flutter_test/flutter_test.dart';

/// 构造一个被外部 [Completer] 控制的 dataLoader，便于精确控制加载流程。
Future<void> Function() _controlledLoader(Completer<void> completer) {
  return () => completer.future;
}

/// 将 [LoadingBody] 包装到一个最小的 [MaterialApp] 中，便于 Theme 与 Directionality 生效。
Widget _wrap(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  group('LoadingBody - dataLoader 为 null', () {
    testWidgets('直接渲染 body，不显示 loading', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: null,
            bodyBuilder: (_) => const Text('body'),
          ),
        ),
      );

      check(find.text('body').evaluate().length).equals(1);
      check(find.byType(CupertinoActivityIndicator).evaluate()).isEmpty();
    });
  });

  group('LoadingBody - 加载中', () {
    testWidgets('默认 loading widget 为 CupertinoActivityIndicator', (tester) async {
      final completer = Completer<void>();

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: _controlledLoader(completer),
            bodyBuilder: (_) => const Text('body'),
          ),
        ),
      );

      // 还未 settle，仍处于 loading
      check(find.byType(CupertinoActivityIndicator).evaluate().length).equals(1);
      check(find.text('body').evaluate()).isEmpty();

      // 完成加载，避免 pending timer
      completer.complete();
      await tester.pumpAndSettle();
    });

    testWidgets('自定义 loadingWidgetBuilder 优先生效', (tester) async {
      final completer = Completer<void>();

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: _controlledLoader(completer),
            bodyBuilder: (_) => const Text('body'),
            loadingWidgetBuilder: (_) => const Text('custom-loading'),
          ),
        ),
      );

      check(find.text('custom-loading').evaluate().length).equals(1);
      check(find.byType(CupertinoActivityIndicator).evaluate()).isEmpty();

      completer.complete();
      await tester.pumpAndSettle();
    });

    testWidgets('loadingWidgetBuilder 返回 null 时回退到默认 loading widget', (tester) async {
      final completer = Completer<void>();

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: _controlledLoader(completer),
            bodyBuilder: (_) => const Text('body'),
            loadingWidgetBuilder: (_) => null,
          ),
        ),
      );

      check(find.byType(CupertinoActivityIndicator).evaluate().length).equals(1);

      completer.complete();
      await tester.pumpAndSettle();
    });
  });

  group('LoadingBody - 加载成功', () {
    testWidgets('加载成功后渲染 body', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(find.text('body').evaluate().length).equals(1);
      check(find.byType(CupertinoActivityIndicator).evaluate()).isEmpty();
    });
  });

  group('LoadingBody - 加载失败', () {
    testWidgets('默认失败 widget 显示 error 文本', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async => throw 'boom',
            bodyBuilder: (_) => const Text('body'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(find.text('boom').evaluate().length).equals(1);
      check(find.text('body').evaluate()).isEmpty();
    });

    testWidgets('点击默认失败 widget 会触发重新加载', (tester) async {
      var attempt = 0;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {
              attempt++;
              if (attempt == 1) throw 'fail-1';
            },
            bodyBuilder: (_) => const Text('body'),
          ),
        ),
      );

      await tester.pumpAndSettle();
      check(find.text('fail-1').evaluate().length).equals(1);

      await tester.tap(find.text('fail-1'));
      await tester.pumpAndSettle();

      check(attempt).equals(2);
      check(find.text('body').evaluate().length).equals(1);
    });

    testWidgets('自定义 loadFailedWidgetBuilder 接收 controller 与 error', (tester) async {
      late dynamic capturedError;
      late LoadingBodyController capturedController;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async => throw 'custom-error',
            bodyBuilder: (_) => const Text('body'),
            loadFailedWidgetBuilder: (context, controller, error) {
              capturedError = error;
              capturedController = controller;
              return const Text('custom-failed');
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(capturedError).equals('custom-error');
      check(find.text('custom-failed').evaluate().length).equals(1);
      check(capturedController).isA<LoadingBodyController>();
    });

    testWidgets('loadFailedWidgetBuilder 返回 null 时回退到默认失败 widget', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async => throw 'fallback-error',
            bodyBuilder: (_) => const Text('body'),
            loadFailedWidgetBuilder: (_, __, ___) => null,
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(find.text('fallback-error').evaluate().length).equals(1);
    });
  });

  group('LoadingBody - controller', () {
    testWidgets('onLoadingBodyCreated 回调会接收到 controller', (tester) async {
      LoadingBodyController? controller;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
            onLoadingBodyCreated: (c) => controller = c,
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(controller).isNotNull();
    });

    testWidgets('controller.reloadData 会触发 dataLoader 再次执行', (tester) async {
      LoadingBodyController? controller;
      var loadCount = 0;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {
              loadCount++;
            },
            bodyBuilder: (_) => const Text('body'),
            onLoadingBodyCreated: (c) => controller = c,
          ),
        ),
      );

      await tester.pumpAndSettle();
      check(loadCount).equals(1);

      controller!.reloadData();
      await tester.pumpAndSettle();

      check(loadCount).equals(2);
    });

    testWidgets('widget 被销毁后调用 reloadData 会触发 assert 提示', (tester) async {
      LoadingBodyController? controller;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
            onLoadingBodyCreated: (c) => controller = c,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 销毁 LoadingBody
      await tester.pumpWidget(_wrap(const Text('other')));
      await tester.pumpAndSettle();

      // debug 模式下 assert 生效，提示页面已销毁
      check(() => controller!.reloadData()).throws<AssertionError>();
    });
  });

  group('LoadingBody - 监听器', () {
    testWidgets('成功流程依次触发 loading 与 success 监听器', (tester) async {
      final calls = <String>[];

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
            dataLoadingListener: () => calls.add('loading'),
            dataLoadedSuccessListener: () => calls.add('success'),
            dataLoadedFailedListener: (_) => calls.add('failed'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(calls).deepEquals(['loading', 'success']);
    });

    testWidgets('失败流程触发 loading 与 failed 监听器，且回调能拿到 error', (tester) async {
      final calls = <String>[];
      dynamic capturedError;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async => throw 'oops',
            bodyBuilder: (_) => const Text('body'),
            dataLoadingListener: () => calls.add('loading'),
            dataLoadedSuccessListener: () => calls.add('success'),
            dataLoadedFailedListener: (e) {
              calls.add('failed');
              capturedError = e;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      check(calls).deepEquals(['loading', 'failed']);
      check(capturedError).equals('oops');
    });

    testWidgets('reloadData 会触发 dataReloadListener', (tester) async {
      LoadingBodyController? controller;
      var reloadCount = 0;

      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
            onLoadingBodyCreated: (c) => controller = c,
            dataReloadListener: () => reloadCount++,
          ),
        ),
      );

      await tester.pumpAndSettle();
      check(reloadCount).equals(0);

      controller!.reloadData();
      await tester.pumpAndSettle();

      check(reloadCount).equals(1);
    });
  });

  group('LoadingBody - initialAnimated', () {
    testWidgets('开启后加载完成时通过 Opacity 渐入显示', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {},
            bodyBuilder: (_) => const Text('body'),
            initialAnimated: true,
          ),
        ),
      );

      // 等 future 完成但动画尚未推进
      await tester.pump();
      await tester.pump();

      // 此时 body 已渲染，但 Opacity 应处于动画过程中
      final opacityFinder = find.ancestor(
        of: find.text('body'),
        matching: find.byType(Opacity),
      );
      check(opacityFinder.evaluate()).isNotEmpty();

      // 动画进行到一半，opacity 应在 (0, 1) 之间
      await tester.pump(const Duration(milliseconds: 150));
      final midOpacity = tester.widget<Opacity>(opacityFinder.first).opacity;
      check(midOpacity).isGreaterThan(0.0);
      check(midOpacity).isLessThan(1.0);

      // 动画走完
      await tester.pumpAndSettle();
      final finalOpacity = tester.widget<Opacity>(opacityFinder.first).opacity;
      check(finalOpacity).equals(1.0);
    });
  });

  group('LoadingBody - initialDelayedDisplay', () {
    testWidgets('快速完成的加载会被延迟至 300ms 才显示 body', (tester) async {
      await tester.pumpWidget(
        _wrap(
          LoadingBody(
            dataLoader: () async {}, // 立即完成
            bodyBuilder: (_) => const Text('body'),
            initialDelayedDisplay: true,
          ),
        ),
      );

      // 等微任务跑完，但还没到 300ms
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      check(find.text('body').evaluate()).isEmpty();
      check(find.byType(CupertinoActivityIndicator).evaluate().length).equals(1);

      // 推进到 300ms 后 body 才出现
      await tester.pump(const Duration(milliseconds: 250));
      await tester.pumpAndSettle();
      check(find.text('body').evaluate().length).equals(1);
    });
  });
}
