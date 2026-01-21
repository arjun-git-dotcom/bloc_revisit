import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';


void main() async {
 


  runApp(
    BlocProvider(
      create: (context) => ColorBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ColorBloc>(context);

    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) => Scaffold(
        backgroundColor: state.theme,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  bloc.add(ColorTheme(Colors.red));
                },
                child: Text('red'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.add(ColorTheme(Colors.blue));
                },
                child: Text('blue'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.add(ColorTheme(Colors.green));
                },
                child: Text('green'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.add(ColorTheme(Colors.yellow));
                },
                child: Text('yellow'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.add(ColorTheme(Colors.pink));
                },
                child: Text('pink'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
