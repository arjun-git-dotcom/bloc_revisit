import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleState(false)) {
    on<ToggleTheme>((event, emit) async {
      emit(ToggleState(!state.isdarkTheme));
      

      final theme = await SharedPreferences.getInstance();
      theme.setBool("state", state.isdarkTheme);
    });

    on<LoadTheme>((event, emit) async {
      final theme = await SharedPreferences.getInstance();
      bool loadedValue = theme.getBool("state") ?? false;
      emit(ToggleState(loadedValue));
     
    });
  }
}
