import 'package:get_it/get_it.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/home/domain/usecases/get_home_content.dart';
import 'package:lennar_associates/home/presentation/blocs/home_bloc.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerLazySingleton<S>(() => S());

  serviceLocator.registerFactory<HomeBloc>(() => HomeBloc());

  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());

  serviceLocator.registerFactory<PostLoginSubmit>(() => PostLoginSubmit());

  serviceLocator.registerFactory<GetHomeContent>(() => GetHomeContent());
}
