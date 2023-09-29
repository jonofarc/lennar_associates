import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';

import 'package:lennar_associates/shared/shared_preferences/local_storage.dart';

import 'package:mockito/mockito.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = MockSharedPreferences();

  group('LocalStorage', () {
    final localStorage = LocalStorage();

    const localStorageKey = 'testKey';
    const localStorageBoolKey = 'testBoolKey';

    const storedString = 'jonathan';
    const storedBool = true;

    setUpAll(() {
      SharedPreferences.setMockInitialValues({localStorageKey: storedString});

      when(sharedPreferences.getString(localStorageKey))
          .thenReturn(storedString);

      when(sharedPreferences.getBool(localStorageBoolKey))
          .thenReturn(storedBool);
    });

    test('setString - successful', () async {
      final result = await localStorage.setString(storedString,
          localStorageKey: localStorageKey);
      expect(result, true);
    });

    test('getString - successful', () async {
      final result = await localStorage.getString(localStorageKey);
      expect(result, storedString);
    });

    test('setBool - successful', () async {
      final result =
          await localStorage.setBool(localStorageBoolKey, storedBool);
      expect(result, storedBool);
    });

    test('getBool - successful', () async {
      final result = await localStorage.getBool(localStorageBoolKey);
      expect(result, storedBool);
    });

    test('remove - successful', () async {
      final result =
          await localStorage.remove(localStorageKey: localStorageKey);
      expect(result, true);
    });
  });
}
