import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  @JsonKey(name: 'download_url', required: false)
  final String downloadUrl;

  const Photo({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}
