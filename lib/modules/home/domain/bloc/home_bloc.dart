import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/home_datasource.dart';
import '../../data/models/short_description.dart';
import '../../data/models/skill_icon.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _Initial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
      event.maybeWhen(
          load: () => _handleLoad(emit), orElse: () => const HomeEvent.load());
    });
  }

  Future<FutureOr<void>> _handleLoad(
    Emitter<HomeState> emit,
  ) async {
    HomeDataSource data = HomeDataSource();

    emit(_Loaded(
      about: data.aboutMe,
      education: data.education,
      works: data.works,
      trivia: data.trivia,
      skills: data.skills,
      phone: data.phone,
      mail: data.mail,
      linkedin: data.linkedin,
    ));
  }
}
