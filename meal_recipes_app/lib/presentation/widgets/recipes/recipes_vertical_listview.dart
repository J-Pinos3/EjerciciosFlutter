import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:meal_recipes_app/config/helpers/tags_formats.dart';
import 'package:meal_recipes_app/domain/entities/full_recipe.dart';

class RecipesVerticalListView extends StatefulWidget {
  const RecipesVerticalListView({
    super.key,
    required this.recipes
    });

  final List<FullRecipe> recipes;


  @override
  State<RecipesVerticalListView> createState() => _RecipesVerticalListViewState();
}

class _RecipesVerticalListViewState extends State<RecipesVerticalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics() ,
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return FadeInRight(
          child: _Slide(fullRecipe: widget.recipes[index],),
        );
      },
    );
  }
}


class _Slide extends StatelessWidget {
  const _Slide({ required this.fullRecipe});

  final FullRecipe fullRecipe;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //IMÁGEN
          SizedBox(
            width: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image.network(
                fullRecipe.strMealThumb,
                fit: BoxFit.cover,
                width: 110,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null){
                    return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                  }

                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: FadeIn(child: child,),
                  );
                },
              ),
            ),
          ),


          //COLUMNA TITULO Y TAGS
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(25,0,10,0 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TagsFormats.infoTag(fullRecipe.strTags),
                    style:const TextStyle(
                      color: Color.fromARGB(255, 102, 159, 104),
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
              
                  const SizedBox(height: 5,),
              
                  Text(
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    fullRecipe.strMeal,
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
              
                  const SizedBox(height: 5,),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Text(
                          fullRecipe.strArea,
                          style:TextStyle(
                            color: Colors.green[900],
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ), 
            
                      const SizedBox(width: 20,),
              
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Text(
                          "${fullRecipe.idMeal.substring(1,3)} min.",
                          style:TextStyle(
                            color: Colors.green[900],
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ), 
              
                    ],
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}