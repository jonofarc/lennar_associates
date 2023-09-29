import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/home/presentation/widgets/photo_widget.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';

class PhotosWidget extends StatelessWidget {
  const PhotosWidget({
    super.key,
    required this.photos,
  });

  final Photos photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.photoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: paddingDefault),
          child: PhotoWidget(
            url: photos.photoList[index].url,
            downloadUrl: photos.photoList[index].downloadUrl,
            author: photos.photoList[index].author,
          ),
        );
      },
    );
  }
}
