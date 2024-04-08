import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = "buttons_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded) ,
        onPressed: (){
          //regresar a la pantalla anterior
          context.pop();
        } ,
      ),
    );
  }
}


class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Elevated")),
            const ElevatedButton(onPressed:null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(onPressed: (){}, child:const Text("Filled") ),
            FilledButton.icon(onPressed: (){}, 
              icon: const Icon(Icons.accessibility_new),
              label: const Text("Filled Icon"),
            ),
            OutlinedButton(onPressed: (){}, child: const Text("Outlined")),
            OutlinedButton.icon(onPressed: (){}, 
              icon: const Icon(Icons.terminal),
              label: const Text("Outlined Icon"),
            ),
            TextButton(onPressed: (){}, child: const Text("Text Button")),
            TextButton.icon(onPressed: (){}, 
              icon: const Icon(Icons.account_box_outlined),
              label: const Text("Text Icon"),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_outlined)),
            IconButton(onPressed: (){},
              icon: const Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.black26)
              ),
            ),
            
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //envuelvo el padding con in Inkwel y le paso su función on tap para que tenga una animacion
    //de botón clicado
    //envolvemos todo con un ClipRRect para ajustar los bordes a rendonditos
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          //borderRadius: BorderRadius, se puede poner esto para los bordes, OPCION 2
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hola Mundillio", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}