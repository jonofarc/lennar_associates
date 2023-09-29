import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage_key.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockLocalStorage extends Mock {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = MockSharedPreferences();

  final localStorage = LocalStorage();
  const userName = 'testUser';
  const password = 'testPassword';

  setUpAll(() {
    SharedPreferences.setMockInitialValues(
        {LocalStorageKey.storedUsername: userName});
    SharedPreferences.setMockInitialValues(
        {LocalStorageKey.storedPassword: password});

    when(sharedPreferences.getString(LocalStorageKey.storedUsername))
        .thenReturn(userName);
    when(sharedPreferences.getString(LocalStorageKey.storedPassword))
        .thenReturn(password);
  });

  test('storeCredentials - successful', () async {
    final appUtils = AppUtils();
    await appUtils.storeCredentials(userName: userName, password: password);
    final result = await localStorage.getString(LocalStorageKey.storedUsername);
    expect(result, userName);
  });

  test('clearCredentials - successful', () async {
    // Arrange
    final appUtils = AppUtils();

    // Act
    await appUtils.clearCredentials();

    final storedUserName =
        await localStorage.getString(LocalStorageKey.storedUsername);
    final storedUserPassword =
        await localStorage.getString(LocalStorageKey.storedUsername);
    expect(storedUserName, null);
    expect(storedUserPassword, null);
  });
}
