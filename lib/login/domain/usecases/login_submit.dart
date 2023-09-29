import 'package:dartz/dartz.dart';
import 'package:lennar_associates/login/domain/repositories/login_repository.dart';
import 'package:lennar_associates/shared/network/failures.dart';

class PostLoginSubmit {
  PostLoginSubmit();

  Future<Either<ServerFailure, bool>> execute(
      {required String username, required String password}) async {
    return await LoginRepository()
        .loginSubmit(username: username, password: password);
  }
}
