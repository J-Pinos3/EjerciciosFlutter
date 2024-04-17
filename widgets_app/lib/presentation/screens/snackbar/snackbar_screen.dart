import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const String name = "snackbar_screen";

  void showCustomSnackbar(BuildContext contex){

    ScaffoldMessenger.of(contex).clearSnackBars();

    final mySnackBar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(label: "Ok", onPressed: (){},),
    );

    ScaffoldMessenger.of(contex).showSnackBar( mySnackBar );
  }


  void openDialog(BuildContext context){
    //builder is something build in runtime
    showDialog(
      context: context, 
      //the user must press one of the buttons in order to close the dialog
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo. Estos textos hacen parecerlo un español que se puede leer. Muchos paquetes de autoedición y editores de páginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una búsqueda de  va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a través de los años, algunas veces por accidente, otras veces a propósito (por ejemplo insertándole humor y cosas por el estilo). "),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: const Text("Cancel")),
          FilledButton(onPressed: (){
            Navigator.of(context).pop();
          }, child:Text("Accept"))
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar and Dialogs Screen"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500")
                  ]
                );
              },
              child: const Text("Used Licenses")
            ),
            
            const SizedBox(height: 20,),

            FilledButton.tonal(
              onPressed: ()=>openDialog(context),
              child: const Text("Used Dialogs")
            ),            
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}