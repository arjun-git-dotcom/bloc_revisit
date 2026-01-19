import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

List<Color> colours = [Colors.red, Colors.blue, Colors.green,Colors.yellow];
int currentIndex=0;

class Counterbloc extends Bloc<ColorEvent, ColorState> {
  Counterbloc() : super(ColorState(Colors.red)) {
    on<IncrementColor>((event, emit) {
      currentIndex = (currentIndex + 1) % colours.length;
      state.colorValue = colours[currentIndex];
      emit(ColorState(state.colorValue));
    });
  }
}
