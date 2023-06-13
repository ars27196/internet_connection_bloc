import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_bloc/bloc/internet_bloc/internet_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
          if (state is InternetLostState) {
            return Container(
                margin: const EdgeInsets.all(20),
                child: const Center(child: Text("Internet Lost")));
          } else if (state is InternetGainedState) {
            return Container(
              margin: const EdgeInsets.all(20),
              child: const Center(child: Text("Internet Connect")),
            );
          } else {
            return Container(
              margin: const EdgeInsets.all(20),
              child: const Center(child: Text("Loading...")),
            );
          }
        }),
      ),
    ));
  }
}
