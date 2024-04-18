import 'package:flutter/material.dart';

class MenuItem{
    final String title;
    final String subTitle;
    final String link;
    final IconData icon;

    const MenuItem({
        required this.title,
        required this.subTitle, 
        required this.link, 
        required this.icon
    });
}

const List<MenuItem> appMenuItems = [
    MenuItem(
        title: "Botones", 
        subTitle: "Varios botones en flutter", 
        link: "/buttons", 
        icon: Icons.smart_button_outlined
    ),

    MenuItem(
        title: "Tarjetas", 
        subTitle: "Contenedor estilizado", 
        link: "/cards", 
        icon: Icons.credit_card
    ),


    MenuItem(
        title: "Progress Indicators", 
        subTitle: "Generales y controlados", 
        link: "/progress", 
        icon: Icons.refresh_rounded
    ),

    MenuItem(
        title: "Snackbars and Dialogs", 
        subTitle: "Indicadores en pantalla", 
        link: "/snackbars", 
        icon: Icons.info_outline
    ),    


    MenuItem(
        title: "Animated Container", 
        subTitle: "Stateful widget animado", 
        link: "/animated", 
        icon: Icons.check_box_outline_blank
    ),   

    MenuItem(
        title: "Ui Controls", 
        subTitle: "Controles de flutter", 
        link: "/ui-controls", 
        icon: Icons.car_rental_outlined
    ),   

    MenuItem(
        title: "App Tutorial", 
        subTitle: "Introducción a la app", 
        link: "/tutorial", 
        icon: Icons.accessible_rounded
    ),   

    MenuItem(
        title: "Comida", 
        subTitle: "Queremos comer", 
        link: "/food", 
        icon: Icons.food_bank_outlined
    ),

];