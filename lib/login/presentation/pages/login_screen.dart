import 'package:flutter/material.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/login/presentation/pages/login_view_mobile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state is LoginSuccess) {
          //update to redirect to main view
          return const LoginViewMobile();
        } else if (state is LoginLoading) {
          return const LoginViewMobile(
            loading: true,
          );
        } else if (state is LoginError) {
          return const LoginViewMobile(
            error: true,
          );
        } else {
          return const LoginViewMobile();
        }
        return Container();
      },
    );
  }
}
