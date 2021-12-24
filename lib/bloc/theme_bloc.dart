import 'package:bloc/bloc.dart';
import 'package:todolist/events/theme_events.dart';
import 'package:todolist/states/theme_states.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLightState()) {
    on<ThemeLightEvent>(onLight);
    on<ThemeDarkEvent>(onDark);
  }

  void onLight(ThemeLightEvent event, Emitter<ThemeState> emit) {
    (state is ThemeDarkState)
        ? emit(ThemeLightState())
        : emit(ThemeDarkState());
  }

  void onDark(ThemeDarkEvent event, Emitter<ThemeState> emit) {
    (state is ThemeLightState)
        ? emit(ThemeDarkState())
        : emit(ThemeLightState());
  }
}
