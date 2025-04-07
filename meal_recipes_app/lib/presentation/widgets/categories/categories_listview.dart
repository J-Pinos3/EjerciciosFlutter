
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:meal_recipes_app/domain/entities/entities.dart';



class CategoriesListView extends StatefulWidget {


  const CategoriesListView({
    super.key,
    required this.categories
  });

  final List<Category> categories;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {

  final ScrollController scrollController = ScrollController();
  String choosenCategory = "";
  bool addIcon = false;
  double position = 0;


  @override
  Widget build(BuildContext context) {
    bool favorite = false;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.categories.length, //+1 para el ícono de la flecha
        itemBuilder: (context, index) {

//onTap: () { choosenCategory = widget.categories[index].strCategory; },
// backgroundColor: 
          return FadeInRight(
            duration: const Duration(milliseconds: 90),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ActionChip(
                
                backgroundColor: Color.fromARGB(255, 235, 235, 235),
                label: Text(widget.categories[index].strCategory),
                onPressed: (){
                  setState(() {
                    choosenCategory = widget.categories[index].strCategory;
                  });
                },
              )
            ),
          );
          
        },
      ),
    );
  }
}

