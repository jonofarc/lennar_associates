import 'package:dartz/dartz.dart';
import 'package:lennar_associates/home/data/models/photo.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/home/domain/repositories/home_content_repository.dart';
import 'package:lennar_associates/shared/network/failures.dart';

class GetHomeContent {
  GetHomeContent();

  Future<Either<ServerFailure, Photos>> execute() async {
    return await HomeContentRepository().fetchContent();
  }
}
