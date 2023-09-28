import 'package:flutter/material.dart';
import 'package:lennar_associates/login/presentation/pages/login_view_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget layout = Container();

    //here is where diferent screens could be passed depending on criteria such as mobile or desktop sizes

    return const LoginViewMobile();
  }
}
