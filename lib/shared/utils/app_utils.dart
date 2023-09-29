import 'package:flutter/material.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';

import 'constants.dart';

class AppUtils {
  AppBar getDefaultAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(appName,
          style: AppTextStyle.headingH2.withColor(defaultTextColor)),
    );
  }

  AppBar getLogOutAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title:
          Text(appName, style: AppTextStyle.large.withColor(defaultTextColor)),
      actions: [_cancelButton(defaultTextColor)],
    );
  }

  Widget _cancelButton(Color color) {
    final s = S();
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: TextButton(
        onPressed: () {
          print("Log out pressed");
        },
        child: Text(
          s.logout,
          style: AppTextStyle.button.withColor(color),
        ),
      ),
    );
  }
}
