import 'package:flutter/material.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/home/presentation/widgets/photos_widget.dart';
import 'package:lennar_associates/shared/utils/constants.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    super.key,
    this.photos = const Photos(photoList: []),
    this.errorMessage = "",
  });

  final Photos photos;
  final String errorMessage;

  @override
  _HomeViewMobileState createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S();
    var url2 = "https://picsum.photos/200/300?random=1";
    return Padding(
      padding: const EdgeInsets.only(
        left: paddingDefault,
        right: paddingDefault,
      ),
      child: Column(
        children: [
          if (widget.photos.photoList.isNotEmpty) ...[
            Expanded(
              child: PhotosWidget(
                photos: widget.photos,
              ),
            )
          ]
        ],
      ),
    );
  }
}
