
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class RecipesHorizontalListView extends StatefulWidget {
  const RecipesHorizontalListView({
    super.key,
    required this.recipes,
    required this.title
    });

  final List<FullRecipe> recipes;
  final String title;

  @override
  State<RecipesHorizontalListView> createState() => _RecipesHorizontalListViewState();
}

class _RecipesHorizontalListViewState extends State<RecipesHorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [

          if(widget.title != null)
            _Title(title: widget.title),
          
          const SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.recipes.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(fullRecipe: widget.recipes[index])
                );
              },
            ),
          ),          
        ],
      )
    );
  }
}


class _Slide extends StatelessWidget {
  const _Slide({required this.fullRecipe});

  final FullRecipe fullRecipe;
  

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          //image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fullRecipe.strMealThumb,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress!=null){
                    return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                  }

                  return GestureDetector(
                    onTap: (){

                    },
                    child: FadeIn(child: child,),
                  );
                },
              ),
            ),
          ),
          
          const SizedBox(height: 5,),

          //recipe name
          SizedBox(
            width: 150,
            child: Text(
              fullRecipe.strMeal,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          //area and time
          SizedBox(
            width: 150,
            child: Row(
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
                //const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    "${fullRecipe.idMeal.substring(1,3)} min.",
                    style:TextStyle(
                      height: 1.5,
                      wordSpacing: 1.5,
                      backgroundColor:  Color.fromARGB(31, 135, 135, 135),
                      color: Colors.green[900],
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),                 
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: FilledButton.tonal(
        style: const ButtonStyle(visualDensity: VisualDensity.compact, backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 235, 235, 235))),
        onPressed: (){},
        child: Text(
          title,
          style: TextStyle(color: Colors.green[900], fontSize: 20.0, fontWeight: FontWeight.w600)
          
        )
      ),
    );
  }
}

