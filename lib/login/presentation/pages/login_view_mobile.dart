import 'package:flutter/material.dart';
import 'package:lennar_associates/generated/l10n.dart';
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
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _userNameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S();
    return Padding(
      padding: const EdgeInsets.only(
        left: paddingDefault,
        right: paddingDefault,
      ),
      child: Column(
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
            controller: _userNameTextController,
            decoration: InputDecoration(
              labelText: s.userName,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),

          TextField(
            controller: _userNameTextController,
            decoration: InputDecoration(
              labelText: s.password,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
