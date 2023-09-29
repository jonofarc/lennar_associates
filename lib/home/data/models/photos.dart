import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lennar_associates/home/data/models/photo.dart';

@JsonSerializable()
class Photos {
  final List<Photo> photoList;

  Photos({required this.photoList});

  factory Photos.fromJson(List<dynamic> json) {
    List<Photo> photos = [];
    for (var item in json) {
      photos.add(Photo.fromJson(item));
    }
    return Photos(photoList: photos);
  }
}
