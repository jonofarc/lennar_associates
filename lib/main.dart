import 'package:flutter/material.dart';
import 'package:lennar_associates/login/presentation/pages/login_screen.dart';
import 'package:lennar_associates/shared/injectable_init.dart';
import 'package:lennar_associates/shared/widgets/widget_utils.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appName),
      supportedLocales: S.delegate.supportedLocales,
      locale: View.of(context).platformDispatcher.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate, // Add this delegate
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Add this delegate
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().getDefaultAppbar(context),
      body: const Center(
        child: LoginScreen(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
