


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';



class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(Colors.white)) {
    on<ColorTheme>((event, emit) async {
      emit(ColorState(event.color));
    });

    
  }
}
