import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Card(
      margin: const EdgeInsets.only(
          right: paddingDefault,
          left: paddingDefault,
          top: paddingDefault,
          bottom: 0),
      child: Padding(
        padding: const EdgeInsets.all(paddingDefault),
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: downloadUrl,
                  placeholder: (context, url) =>
                      const LoadingWidget(width: 300, height: 300),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: paddingDefault,
              ),
              Text(author),
              const SizedBox(
                height: paddingDefault,
              ),
              GestureDetector(
                child: Text(
                  url,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  _launchUrl();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    if (url.isNotEmpty) {
      Uri uri = Uri.parse(url);
      try {
        await launchUrl(uri);
      } catch (e) {
        throw 'Could not launch $url with error ${e.toString()}';
      }
    }
  }
}
