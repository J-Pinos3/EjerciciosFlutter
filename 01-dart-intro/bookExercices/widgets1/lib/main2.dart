import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/* STEPPER
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Playground",
      home: Scaffold(
        appBar: AppBar(title: const Text("FLUTTER!"),),
        body: Stepper(
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepContinue: currentStep < 2 ?
          ()=>setState(()=>currentStep += 1) : null,
          onStepCancel: currentStep > 0 ?
          ()=>setState(()=>currentStep -= 1) : null  ,
          steps: const [
            Step(
              title: Text("Shippind"),
              isActive: true,
              content: Text("Shipping your package")
            ),

            Step(
              title: Text("Sending"),
              isActive: true,
              content: Text("Your package will arrive son")
            ),

            Step(
              title: Text("Delivering"),
              isActive: true,
              content: Text("Receive your package")
            ),
          ],
        ),
      ),
    );
  }
}
*/

/* BOTTOM NAVIGATION BAR
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _currentPage = 0;

  var _pages = [
    Text("Page 1 - Announcements"),
    Text("Page 2 - Birthdays"),
    Text("Page 3 - Data"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Play Ground",
      home: Scaffold(
        body: Center(child: _pages.elementAt(_currentPage),),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: "Announcements"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: "Birthdays"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: "Data"
            ),
          ],
          currentIndex: _currentPage,
          fixedColor: Colors.red,
          onTap: (int index){
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
*/



/* LATERAL DRAWER
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Flutter Playground",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter!!!"),
        ),
        drawer: const Drawer(
          child: Column(
            children: [
              Text("Item 1"),
              Divider(),
              Text("Item 2"),
              Divider(),
              Text("Item 3"),
              Divider()                            
            ],
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("R1"),
              Text("R2"),
              Text("R3"),
            ],
          ),
        ),
      ),
    );
  }
}
*/



/* CARDS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Playground",
      home: Scaffold(
        body: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Child 1"),
                Divider(),
                Text("Child 2"),
                Divider(),
                Text("Child 3")
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/