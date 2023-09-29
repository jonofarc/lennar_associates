import 'package:flutter/material.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/shared/utils/app_text_style.dart';
import 'package:lennar_associates/shared/utils/app_utils.dart';

import '../utils/constants.dart';

class WidgetUtils {
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
      title: Text(appName,
          style: AppTextStyle.headingH2.withColor(defaultTextColor)),
      actions: [_logoutButton(defaultTextColor, context)],
      automaticallyImplyLeading: false,
    );
  }

  Widget _logoutButton(Color color, BuildContext context) {
    final s = S();
    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: TextButton(
        onPressed: () {
          AppUtils().doLogout(context);
        },
        child: Text(
          s.logout,
          style: AppTextStyle.button.withColor(color),
        ),
      ),
    );
  }
}
