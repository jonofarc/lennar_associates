import 'package:flutter/material.dart';
import 'package:lennar_associates/login/presentation/pages/login_screen.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';
import 'package:lennar_associates/shared/utils/constants.dart';

void main() {
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
      appBar: AppUtils().getDefaultAppbar(context),
      body: const Center(
        child: LoginScreen(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
