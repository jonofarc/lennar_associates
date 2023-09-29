import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/home/presentation/pages/home_screen.dart';
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
  Widget build(BuildContext buildContext) {
    final s = S();
    var borderColor = widget.error
        ? const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          )
        : const OutlineInputBorder();

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
              enabledBorder: borderColor,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          TextField(
            controller: _passwordTextController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: s.password,
              enabledBorder: borderColor,
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
                  FocusScope.of(context).unfocus();

                  BlocProvider.of<LoginBloc>(context).add(LoginSubmit(
                      _userNameTextController.text,
                      _passwordTextController.text));
                },
                child: Text(s.login),
              ),
            ),
          ],
          const SizedBox(
            height: paddingDefault,
          ),
          if (widget.error)
            Text(
              s.loginError,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
