import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu_items/menu_items.dart';


class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    //no puedo saber si tiene notch, pero puedo saber si tiene un padding arriba
    //el notch es una partecita negra en la  parte superior de los celulares
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      tilePadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      selectedIndex: null,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });


        final menuItem = appMenuItems[value];
        //Navigator.of(context).pop();
        //context.pop(); para que se cierre el menu
        context.push(menuItem.link);
        //si uso context.go, no se crea un stack de pantallas, solo se mueve a esa ruta
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:  [

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10: 20, 16, 10),
          child: Text("Main"),
        ),

        ...appMenuItems
          .sublist(0,3)
          .map((item) => 
            NavigationDrawerDestination(
              icon: Icon(item.icon), 
              label: Text("${item.title}")
            )
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text("More Options"),
        ),

        ...appMenuItems
          .sublist(3)
          .map((item) => 
            NavigationDrawerDestination(
              icon: Icon(item.icon), 
              label: Text("${item.title}")
            )
        ),
      ]
    );
  }
}