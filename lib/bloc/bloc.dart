import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(false)) {
    on<Login>((event, emit) {
      emit(AuthState(true));
    });
  }
}
