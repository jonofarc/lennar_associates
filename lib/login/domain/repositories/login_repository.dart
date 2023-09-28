import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lennar_associates/shared/network/failures.dart';
import 'package:lennar_associates/shared/utils/constants.dart';

class LoginRepository {
  Future<Either<ServerFailure, bool>> loginSubmit(
      {required String username, required String password}) async {
    //this API call should call a middle layer such as AWS instead of calling
    //the auth api directly in a full release scenario for security purposes

    final headers = <String, String>{};
    headers["Content-Type"] = "application/json";

    final response = await http.post(
      Uri.parse("${loginBaseUrl}basicAuth"),
      headers: headers,
      body: json.encode(
        {
          'username': username,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
