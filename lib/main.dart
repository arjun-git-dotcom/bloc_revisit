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
      create: (context) => CounterBloc(),
      child: MaterialApp(home: Homepage()),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => Center(child: Text('${state.countValue}'))
        
      ),floatingActionButton: GestureDetector(
        onDoubleTap: ()=>bloc.add(DecrementCounter()),
        child: FloatingActionButton(
          
          onPressed: ()=>bloc.add(IncrementCounter())),
      ),
        
    );
  }
}
