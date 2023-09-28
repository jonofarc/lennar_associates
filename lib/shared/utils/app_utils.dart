import 'package:flutter/material.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';

import 'constants.dart';

class AppUtils {
  AppBar getDefaultAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title:
          Text(appName, style: AppTextStyle.headingH2.withColor(Colors.white)),
    );
  }
}
