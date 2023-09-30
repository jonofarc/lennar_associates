import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/login/domain/usecases/credentials_validation.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/injectable_init.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage.dart';
import 'package:lennar_associates/shared/shared_preferences/local_storage_key.dart';
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
  var loginEnabled = false;

  @override
  void dispose() {
    _userNameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _userNameTextController.addListener(() {
      loginEnableCheck();
    });
    _passwordTextController.addListener(() {
      loginEnableCheck();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var storedUsername =
          await LocalStorage().getString(LocalStorageKey.storedUsername);
      var storedPassword =
          await LocalStorage().getString(LocalStorageKey.storedPassword);

      if (storedUsername != null && storedPassword != null) {
        Log.debug("Attempting login with saved user name and password");
        _userNameTextController.text = storedUsername;
        _passwordTextController.text = storedPassword;

        _loginSubmit(userName: storedUsername, password: storedPassword);
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    final s = serviceLocator<S>();
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
                onPressed: loginEnabled
                    ? () {
                        _loginSubmit(
                            userName: _userNameTextController.text,
                            password: _passwordTextController.text);
                      }
                    : null,
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

  _loginSubmit({required String userName, required String password}) {
    FocusScope.of(context).unfocus();

    BlocProvider.of<LoginBloc>(context).add(LoginSubmit(
      userName: userName,
      password: password,
    ));
  }

  /*
  this function could be refactor  on a more compact way such as

  void loginEnableCheck() {
    final credentialValidation = CredentialValidation();
    setState(() {
      loginEnabled = credentialValidation.validatePassword(
          password: _passwordTextController.text) && credentialValidation.validateUserName(
          username: _userNameTextController.text);
    });
  }

  but separating the validation results makes it more readable and less obfuscated
   */

  void loginEnableCheck() {
    final credentialValidation = CredentialValidation();
    var passwordValid = credentialValidation.validatePassword(
        password: _passwordTextController.text);
    var userNameValid = credentialValidation.validateUserName(
        username: _userNameTextController.text);
    setState(() {
      loginEnabled = passwordValid && userNameValid;
    });
  }
}
