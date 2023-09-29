import 'package:dartz/dartz.dart';
import 'package:lennar_associates/home/data/models/photo.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/shared/network/failures.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lennar_associates/shared/utils/log.dart';

class HomeContentRepository {
  Future<Either<ServerFailure, Photos>> fetchContent() async {
    //this API call should call a middle layer such as AWS instead of calling
    //the auth api directly in a full release scenario for security purposes

    const url = picsumBaseUrl;

    //if (response.statusCode == 200) {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final photos = Photos.fromJson(data);
          return Right(photos);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("cmsContent failed to parse ToolsCollection: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
