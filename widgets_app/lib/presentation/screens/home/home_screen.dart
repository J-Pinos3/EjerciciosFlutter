
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu_items/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {
  
  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //scaffoldKey holds a reference to the current state of the scaffold
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:const Text("Flutter + Material 3"),
        centerTitle: true,
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: appMenuItems.length,
      
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        
        return _CustomListWidget(menuItem: menuItem);
      },
    );
  }
}

class _CustomListWidget extends StatelessWidget {
  const _CustomListWidget({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color:colors.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: (){
        //Navigator.of(context).push(
        //  MaterialPageRoute(
        //   builder: (context) => const ButtonsScreen(),
        //  )
        //);OTRA OPCIÓN ABAJO
        //Navigator.pushNamed(context, menuItem.link);
        
        //AHORA CON GO ROUTER
        context.push(menuItem.link);
        //context.go(menuItem.link);
        //context.pushNamed(CardsScreens.name);
      },
    );
  }
}