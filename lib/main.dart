import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:counterapp/presentation/screen2.dart';

import 'package:counterapp/presentation/screens/home_page.dart';
import 'package:counterapp/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counterCubit = CounterCubit();

@override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const MyHomePage(
              title: 'Home Screen',
              
            )),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'Second Screen',
              color: Colors.redAccent,
            )),
        '/third': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const ThirdScreen(
                title: 'Third Screen',
                color: Colors.greenAccent,
              ),
        )
      },
      //initialRoute: '/',
      //   home: const MyHomePage(title: 'Counter App'),
    );
  }

  
}
