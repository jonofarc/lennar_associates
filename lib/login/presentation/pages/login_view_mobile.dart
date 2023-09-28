import 'package:flutter/material.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';
import 'package:lennar_associates/shared/utils/constants.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
  });

  @override
  _LoginViewMobileState createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final s = S();
    return Column(
      children: [
        const SizedBox(
          height: paddingDefault,
        ),
        // Text(s.userLogin, style: CmsTextStyle.headingH1),
        Text("Login", style: AppTextStyle.headingH1),
        const SizedBox(
          height: paddingDefault,
        ),

        TextField(
          controller: _textController,
          decoration: const InputDecoration(
            labelText: 'User Name',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
