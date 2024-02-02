import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;
  String clicksTexts = "Clicks";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //centerTitle: true, en lugar del Center
        title:const Center(child: Text("Counter Screen")),
      ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text(clicksTexts, style: TextStyle(fontSize: 50),),
            ],
          )
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              counter++;
              if(counter == 1){
                clicksTexts = "Click";
              } else{
                clicksTexts = "Clicks";
              }
            });
          },
          child: const Icon(Icons.plus_one),
        ),
    );
  }
}
