import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lennar_associates/home/data/models/photo.dart';

@JsonSerializable()
class Photos extends Equatable {
  final List<Photo> photoList;

  const Photos({required this.photoList});

  factory Photos.fromJson(List<dynamic> json) {
    List<Photo> photos = [];
    for (var item in json) {
      photos.add(Photo.fromJson(item));
    }
    return Photos(photoList: photos);
  }

  @override
  List<Object?> get props => [photoList];

  Photos shuffle({Random? random}) {
    final shuffledList = List<Photo>.from(photoList)
      ..shuffle(random ?? Random());

    return Photos(photoList: shuffledList);
  }

}
