import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:counterapp/presentation/screen2.dart';
import 'package:counterapp/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title , }) : super(key: key);

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
               BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.incremented == true) {
                      Scaffold.of(context).showBottomSheet(
                        (context) => const Text('counterValue is incremented'),
                        
                       
                      );
                    } else if(state.incremented == false){
                      Scaffold.of(context).showBottomSheet((context) => const Text('counterValue is decremented'));
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
           const SizedBox(
              height:24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: (){
               Navigator.of(context).pushNamed('/second')
              },
            child: const Text('Go to second screen'),
            ),
            const SizedBox(
              height:24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: (){
                
              },
            child: const Text('Go to third screen'),
            )
          ],
        ),
      ),
    );
  }
}
