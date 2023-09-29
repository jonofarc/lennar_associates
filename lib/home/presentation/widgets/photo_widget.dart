import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.url,
    required this.downloadUrl,
    required this.author,
  });

  final String url;
  final String downloadUrl;
  final String author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        imageUrl: downloadUrl,
        placeholder: (context, url) =>
            const LoadingWidget(width: 300, height: 300),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
