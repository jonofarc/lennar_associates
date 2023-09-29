import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/home/presentation/pages/home_screen.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage_key.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/shared/utils/log.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
    this.loading = false,
    this.errorMessage = "",
  });

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

  /*
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var storedUsername =
          await LocalStorage().getString(LocalStorageKey.storedUsername);
      var storedPassword =
          await LocalStorage().getString(LocalStorageKey.storedPassword);

      if (storedUsername != null && storedPassword != null) {
        Log.debug("Attempting login with saved user name and password");
        loginSubmit(userName: storedUsername, password: storedPassword);
      }
    });
  }

   */

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var storedUsername =
          await LocalStorage().getString(LocalStorageKey.storedUsername);
      var storedPassword =
          await LocalStorage().getString(LocalStorageKey.storedPassword);

      if (storedUsername != null && storedPassword != null) {
        Log.debug("Attempting login with saved user name and password");
        _userNameTextController.text = storedUsername;
        _passwordTextController.text = storedPassword;

        loginSubmit(userName: storedUsername, password: storedPassword);
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    final s = S();
    var borderColor = widget.errorMessage.isNotEmpty
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
                  loginSubmit(
                      userName: _userNameTextController.text,
                      password: _passwordTextController.text);
                },
                child: Text(s.login),
              ),
            ),
          ],
          const SizedBox(
            height: paddingDefault,
          ),
          if (widget.errorMessage.isNotEmpty)
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

  loginSubmit({required String userName, required String password}) {
    FocusScope.of(context).unfocus();

    BlocProvider.of<LoginBloc>(context)
        .add(LoginSubmit(userName: userName, password: password));
  }
}
