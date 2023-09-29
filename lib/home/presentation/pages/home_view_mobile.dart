import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/generated/l10n.dart';
import 'package:lennar_associates/home/presentation/blocs/home_bloc.dart';
import 'package:lennar_associates/shared/utils/constants.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    super.key,
  });

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S();
    return Padding(
      padding: const EdgeInsets.only(
        left: paddingDefault,
        right: paddingDefault,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: paddingDefault,
          ),
          Text(s.userName),
        ],
      ),
    );
  }
}
