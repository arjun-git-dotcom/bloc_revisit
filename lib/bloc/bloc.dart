import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  bool initalTheme;
  ToggleBloc({required this.initalTheme}) : super(ToggleState(initalTheme)) {

    on<ToggleTheme>((event, emit) async {
      bool newTheme = !state.isdarkTheme;
      emit(ToggleState(newTheme));

      final theme = await SharedPreferences.getInstance();
      theme.setBool("state", newTheme);
    });
  }
}
