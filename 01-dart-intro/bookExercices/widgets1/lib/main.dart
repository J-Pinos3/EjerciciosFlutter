import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Future _showIt() async{
      switch(await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Whats your favorite food?"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "brocolli");
                },
                child: Text("Brocolli"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "steak");
                },
                child: Text("Steak"),
              )
            ],
          );
        },)){
          case "brocolli": print("Brocolli"); break;
          case "steak": print("Steak");break;
        }
    }
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Show It"),
          onPressed: () async{ await _showIt(); },
        ),
      ),
    );
  }
}

/* DATE & TIME PICKER
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(  home: Scaffold(body: Home(),) );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

 Future<void> _selectDate(BuildContext context) async {
await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                print(value);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$value is the selected date')));
              }
            });
  }

  Future<void> _selectTime(inContext) async { 
    TimeOfDay? selectedTime = await showTimePicker( 
      context : inContext, 
      initialTime : TimeOfDay.now(), 
      ); 
    print(selectedTime); 
  }   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 50,),
          ElevatedButton(onPressed: ()async {
            await _selectDate(context);
          }, child: Text("Pick a Date")),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{ await _selectTime(context); }, child: Text("Pick a Time")),
        ],
      ),
    );
  }
}
*/


/*  FORMS
class LoginData{
  String userName;
  String password;

  LoginData({required this.userName, required this.password});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginData _loginData = LoginData(userName: "", password: "");
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value?.length == 0){
                    return "Enter email or username";
                  }
                  return null;
                },
                onSaved: (newValue) => this._loginData.userName = newValue ?? "dd",
                decoration: const InputDecoration(hintText: "john@doe.com", labelText: "Email Address"),
              ),

              TextFormField(
                obscureText: true,
                validator: (value) {
                  if(value!.length < 10){
                    return "Password lenght must be > 10 characters";
                  }
                  return null;
                },
                onSaved: (newValue) => this._loginData.password = newValue ?? "dd",
                decoration: const InputDecoration(hintText: "Password", labelText: "Password"),
              ),    

              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      print("Username: ${_loginData.userName}");
                      print("Username: ${_loginData.password}");
                  }
                },
                child: const Text("Log in!")
              ),          
            ],
          ),
        ),
      ),
    ),
    );
  }
}
*/
