import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:counterapp/presentation/screen2.dart';

import 'package:counterapp/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        // routes: {
        //   '/': (context) => const MyHomePage(title: 'Home Screen', color: Colors.blueAccent,),
        //   '/second': (context) =>const  SecondScreen(title: 'Second Screen', color: Colors.greenAccent,),
        //   '/third': (context) =>const  SecondScreen(title: 'Third Screen', color: Colors.greenAccent,)
        // },
        home: const MyHomePage(title: 'Counter App'),
      ),
    );
  }
}
