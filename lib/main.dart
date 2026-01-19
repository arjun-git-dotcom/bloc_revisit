import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counterbloc(),
      child: MaterialApp(home: Homepage()),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<Counterbloc>(context);
    return BlocBuilder<Counterbloc, ColorState>(
      builder: (context, state) => Scaffold(
        backgroundColor: state.colorValue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.add(IncrementColor());
            
          },
        ),
      ),
    );
  }
}
