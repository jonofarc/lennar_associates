// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lennar_associates/login/domain/usecases/credentials_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lennar_associates/shared/widgets/widget_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('WidgetUtils', () {
    final widgetUtils = WidgetUtils();
    final BuildContext context =
        MockBuildContext(); // Create a mock context for testing

    test('getDefaultAppbar', () {
      final appBar = widgetUtils.getDefaultAppbar(context);

      expect(appBar, isA<AppBar>());
      expect(appBar.backgroundColor,
          equals(Theme.of(context).colorScheme.primary));
      expect(appBar.title, isA<Text>());
    });

    test('getLogOutAppbar', () {
      final appBar = widgetUtils.getLogOutAppbar(context);

      expect(appBar, isA<AppBar>());
      expect(appBar.backgroundColor,
          equals(Theme.of(context).colorScheme.primary));
      expect(appBar.title, isA<Text>());
      expect(appBar.actions, isA<List<Widget>>());
      expect(appBar.automaticallyImplyLeading, equals(false));
    });
  });
}
