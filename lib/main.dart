import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jan18/bloc/bloc.dart';
import 'package:jan18/bloc/event.dart';
import 'package:jan18/bloc/state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleBloc(),

      child: BlocBuilder<ToggleBloc, ToggleState>(
        builder: (context, state) => MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state.isdarkTheme == true
              ? ThemeMode.dark
              : ThemeMode.light,
          home: Homepage(),
        ),
      ),
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
 
      context.read<ToggleBloc>().add(LoadTheme());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ToggleBloc>(context);

    return BlocBuilder<ToggleBloc, ToggleState>(
      builder: (context, state) => Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              bloc.add(ToggleTheme());
            },
            child: Text('Toggle'),
          ),
        ),
      ),
    );
  }
}
