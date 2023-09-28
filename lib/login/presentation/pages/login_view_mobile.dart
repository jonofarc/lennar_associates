import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';
import 'package:lennar_associates/shared/utils/constants.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
    this.error = false,
    this.loading = false,
    this.errorMessage = "",
  });

  final bool error;
  final bool loading;
  final String errorMessage;
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
            controller: _passwordTextController,
            decoration: InputDecoration(
              labelText: s.password,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          if (widget.loading) ...[
            const CircularProgressIndicator()
          ] else ...[
            SizedBox(
              width: 300.0, // Set the button width to 300 pixels
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginSubmit(
                      _userNameTextController.text,
                      _passwordTextController.text));
                },
                child: Text(s.login),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
