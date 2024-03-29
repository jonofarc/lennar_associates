import 'package:flutter/material.dart';
import 'package:lennar_associates/home/domain/usecases/get_home_content.dart';
import 'package:lennar_associates/home/presentation/blocs/home_bloc.dart';
import 'package:lennar_associates/home/presentation/pages/home_view_mobile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lennar_associates/shared/widgets/loading_widget.dart';
import 'package:lennar_associates/shared/widgets/widget_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: _content(context),
    );
  }

  Widget _content(BuildContext buildContext) {
    return Scaffold(
      appBar: WidgetUtils().getLogOutAppbar(buildContext),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (blocContext, state) {
          if (state is HomeSuccess) {
            return HomeViewMobile(
              photos: state.photos,
            );
          } else if (state is HomeLoading) {
            return const LoadingWidget(
                width: double.infinity, height: double.infinity);
          } else if (state is HomeError) {
            return const HomeViewMobile();
          } else if (state is HomeInitialState) {
            _fetchContent(blocContext);
          } else {
            return const HomeViewMobile();
          }
          return Container();
        },
      ),
    );
  }

  _fetchContent(BuildContext blocContext) {
    BlocProvider.of<HomeBloc>(blocContext).add(LoadHomeContent());
  }
}
