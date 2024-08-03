import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Usuario"),
      ),

      body: const _RegisterView() ,
    );
  }

}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children:[
              FlutterLogo(size: 100,),

              SizedBox(height: 20,),

              _RegisterForm(),


              SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }
}



class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  String userName = '';
  String email = '';
  String password = '';

  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Column(
        children: [

          CustomTextFormFields(
            label: "Nombre de usuario",
            onChanged:(p0) => userName = p0 ,
            onValidator:(p0) {
              if(p0 == null || p0.isEmpty) return "Campo requerido";
              if(p0.trim().isEmpty) return "Campo requerido";
              if(p0.length < 6) return "Mas de 6 caracteres!";

              return null;
            }, 
          ),

          const SizedBox(height: 15,),

          CustomTextFormFields(
            label: "Correo electrónico",
            onChanged: (p0) => email = p0,
            onValidator:(p0) {
              if(p0 == null || p0.isEmpty) return "Campo requerido";
              if(p0.trim().isEmpty) return "Campo requerido";

              final emailRegExp = RegExp( r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if( !emailRegExp.hasMatch(p0) ){ return "Correo sin formato correcto"; }
              return null;
            }, 
          ),

          const SizedBox(height: 15,),

          CustomTextFormFields(
            label: "Contraseña",
            obscure: true,
            onChanged: (p0) => password = p0,
            onValidator:(p0) {
              if(p0 == null || p0.isEmpty) return "Campo requerido";
              if(p0.trim().isEmpty) return "Campo requerido";
              if(p0.length < 6) return "Mas de 6 caracteres!";

              return null;
            },            
          ),

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(
            onPressed: () { 

              final isValid = _formKey.currentState!.validate();
              if(isValid){
                _formKey.currentState!.save();
                print("CREATE DATA Username: $userName Password: $password");
              }
              print('$userName, $email, $password \n');
            },
            icon: const Icon(Icons.save),
            label: const Text("Crear Usuario"),
          ),
        ],
      ),
    );
  }
}