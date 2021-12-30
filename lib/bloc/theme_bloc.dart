import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/states/theme_states.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLightState()) {
    on<ThemeLightEvent>(onLight);
    on<ThemeDarkEvent>(onDark);
    on<GetThemeEvent>(initTheme);
  }

  void initTheme(GetThemeEvent event, Emitter<ThemeState> emit) async {
    var box = Hive.box('THEME');
    log(box.get('theme'), name: 'current theme');
    if (box.get('theme') == null) {
      box.put('theme', 'light');
      emit(ThemeLightState());
    } else if (box.get('theme') is String) {
      if (box.get('theme') == 'light') {
        emit(ThemeLightState());
      } else if (box.get('theme') == 'dark') {
        emit(ThemeDarkState());
      }
    }
  }

  void onLight(ThemeLightEvent event, Emitter<ThemeState> emit) {
    if (state is ThemeDarkState) {
      Hive.box('THEME').put('theme', 'light');
      log(Hive.box('THEME').get('theme'));
      emit(ThemeLightState());
    } else {
      Hive.box('THEME').put('theme', 'dark');
      emit(ThemeDarkState());
    }
  }

  void onDark(ThemeDarkEvent event, Emitter<ThemeState> emit) {
    if (state is ThemeLightState) {
      Hive.box('THEME').put('theme', 'dark');
      log(Hive.box('THEME').get('theme'));
      emit(ThemeDarkState());
    } else {
      Hive.box('THEME').put('theme', 'light');
      log(Hive.box('THEME').get('theme'));
      emit(ThemeLightState());
    }
  }
}
