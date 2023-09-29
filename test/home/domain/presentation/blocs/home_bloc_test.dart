import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lennar_associates/home/data/models/photo.dart';
import 'package:lennar_associates/home/data/models/photos.dart';
import 'package:lennar_associates/home/domain/usecases/get_home_content.dart';
import 'package:lennar_associates/home/presentation/blocs/home_bloc.dart';
import 'package:lennar_associates/login/domain/repositories/login_repository.dart';
import 'package:lennar_associates/login/domain/usecases/login_submit.dart';
import 'package:lennar_associates/login/presentation/blocs/login_bloc.dart';
import 'package:lennar_associates/shared/network/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetHomeContent])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const Photos photos = Photos(photoList: [
    Photo(
        id: "1",
        author: "testAuthor",
        width: 100,
        height: 100,
        url: "www.testurl.com",
        downloadUrl: "www.testdownloadurl.com")
  ]);

  group('HomeBloc', () {
    late MockGetHomeContent mockGetHomeContent = MockGetHomeContent();

    blocTest<HomeBloc, HomeState>(
      'emits [LoginLoading, LoginSuccess] when LoginSubmit is added successfully',
      build: () {
        HomeBloc homeBloc = HomeBloc();
        when(mockGetHomeContent.execute())
            .thenAnswer((_) async => Future.value(const Right(photos)));

        return homeBloc;
      },
      act: (bloc) {
        bloc.add(LoadHomeContent(getHomeContent: mockGetHomeContent));
      },
      expect: () => [const HomeLoading(), const HomeSuccess(photos: photos)],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [LoginLoading, LoginError] when LoginSubmit is added with an error',
      build: () {
        HomeBloc homeBloc = HomeBloc();
        when(mockGetHomeContent.execute()).thenAnswer((_) => Future.value(Left(
            const HomeError(message: 'Test error')
                as ServerFailure))); // Adjust the error as needed
        return homeBloc;
      },
      act: (bloc) {
        bloc.add(LoadHomeContent(getHomeContent: mockGetHomeContent));
      },
      expect: () => [
        const HomeLoading(),
        const HomeError(
          message: 'Test error',
        )
      ],
    );
  });
}
