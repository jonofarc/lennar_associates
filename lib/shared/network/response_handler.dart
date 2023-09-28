import 'dart:convert';

import 'package:http/src/response.dart';

import '../utils/constants.dart';
import 'exceptions.dart';

/*
  custom common class for handling response based on status-code
*/
class ResponseHandler {
  dynamic getResponseData(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw const ServerException(message: badRequestError);
      case 401:
        throw const ServerException(message: authError);
      case 500:
        throw const ServerException(message: internalServerError);
      default:
        throw const ServerException(message: unknownError);
    }
  }
}
