import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';
import '../../presentation/blocs/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Usuario"),
      ),

      //body: const _RegisterView() ,
      body: BlocProvider(
        create: (_) => RegisterCubit(), child: const _RegisterView(),
      ),
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



class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //Register cubit already has the validation functionality
  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [

          CustomTextFormFields(
            label: "Nombre de usuario",
            onChanged:(p0){
              registerCubit.usernameChanged(p0);
              //_formKey.currentState?.validate();
            },
            //onChanged: (p0) { userName = p0; print("cambio: "+ p0.toString()); },
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
            onChanged:(p0){
              registerCubit.emailChanged(p0);

            },
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
            onChanged:(p0){
              registerCubit.passwordChanged(p0);

            },
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

              /*
              final isValid = _formKey.currentState!.validate();
              if(!isValid){
                //_formKey.currentState!.save();
                //print("CREATE DATA Username: $userName Password: $password");
                return;
              }
              */
              
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text("Crear Usuario"),
          ),
        ],
      ),
    );
  }
}