import 'package:counterapp/cubit/counter_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.title , this.color}) : super(key: key);

  final String title;
  final Color? color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
              color: widget.color,
              onPressed: (){
               
              },
            child: const Text('Go to next screen'),
            )
          ],
        ),
      ),
    );
  }
}