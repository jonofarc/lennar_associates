import 'package:flutter/material.dart';
import 'package:lennar_associates/home/presentation/pages/home_screen.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/login/presentation/pages/login_view_mobile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: _content(),
    );
  }

  Widget _content() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (blocContext, state) {
        //remove this to reenable loginscreen

        _loginSuccess(context: blocContext);

        if (state is LoginSuccess) {
          _loginSuccess(context: blocContext);

          return const LoginViewMobile();
        } else if (state is LoginLoading) {
          return const LoginViewMobile(
            loading: true,
          );
        } else if (state is LoginError) {
          return LoginViewMobile(
            errorMessage: state.message,
          );
        } else {
          return const LoginViewMobile();
        }
        return Container();
      },
    );
  }

  _loginSuccess({required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        ),
      );
    });
  }
}
