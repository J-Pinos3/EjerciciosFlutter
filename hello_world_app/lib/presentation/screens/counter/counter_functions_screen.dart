import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int counter = 0;
  String clicksTexts = "Clicks";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true, //en lugar del Center
        title:const Text("Counter Functions"),
        actions: [
            IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
          ),
        ],
      ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text(clicksTexts, style: const TextStyle(fontSize: 50),),
            ],
          )
        ),

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

              CustomButton(icon: Icons.refresh_rounded,
                onPressed: (){
                  setState(() {
                    counter = 0;
                  });
                },
              ),

              const SizedBox(height: 55,),

              CustomButton( icon: Icons.plus_one,
                onPressed: (){
                  setState(() {
                      counter++;
                    if(counter == 1){
                      clicksTexts = "Click";
                    }else{
                      clicksTexts = "Clicks";
                    }
                  });
                },
              ),
              
              const SizedBox(height: 55,),

              CustomButton(icon: Icons.exposure_minus_1_outlined,
                onPressed:(){
                    setState(() {
                      if(counter >= 1){
                        counter--;
                      }else{
                        return ;
                      }
                      
                    if(counter == 1){
                      clicksTexts = "Click";
                    }else{
                      clicksTexts = "Clicks";
                    }
                  });
                } ,
              ),
            ],
          )
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton( {
    super.key,
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
    child: Icon(icon),
    );
  }
}
