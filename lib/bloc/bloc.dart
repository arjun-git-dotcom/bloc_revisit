import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleState(false)) {
    on<ToggleTheme>((event, emit) {
      emit(ToggleState(!state.isdarkTheme));
    });
  }
}
