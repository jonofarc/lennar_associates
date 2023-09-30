import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/shared/widgets/widget_utils.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() async {
    final serviceLocator = GetIt.instance;
    serviceLocator.registerFactory<S>(() => S());
  });

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
