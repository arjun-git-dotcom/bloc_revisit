import 'dart:ui';

abstract class ColorEvent {}

class ColorTheme extends ColorEvent {
  Color color;
  ColorTheme(this.color);
}
