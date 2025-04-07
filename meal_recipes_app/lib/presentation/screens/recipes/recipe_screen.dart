

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_recipes_app/domain/entities/full_recipe.dart';
import 'package:meal_recipes_app/presentation/providers/providers.dart';
import '../../../domain/entities/entities.dart';

class RecipeScreen extends ConsumerStatefulWidget {
  const RecipeScreen({super.key, required this.recipeId});
  
  final String recipeId;
  static const name = "recipe-screen";

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends ConsumerState<RecipeScreen> {


  @override
  void initState() {
    super.initState();

    ref.read(searchRecipeByID.notifier).loadRandomRecipes(widget.recipeId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // ignore: unnecessary_nullable_for_final_variable_declarations
    final FullRecipe? fullRecipe = ref.watch(searchRecipeByID)[ int.parse( widget.recipeId )];

    if(fullRecipe == null){
      return  Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 3, color: Colors.green[900],),
        ),
      );
    }

    return  Scaffold(

      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),

        slivers: [
          _CustomSliverAppBar(fullRecipe: fullRecipe),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _RecipeDetails(fullRecipe: fullRecipe), childCount: 1
          )),
        ],
      ),
    );
  }
}


class _RecipeDetails extends StatelessWidget {
  final FullRecipe fullRecipe;
  const _RecipeDetails({required this.fullRecipe});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _TitleAndOverview(fullRecipe:fullRecipe, size: size, textStyles: textStyles),

        _Tags(fullRecipe:fullRecipe),

      ],
    );
  }
}


class _Tags extends StatelessWidget {
  
  final FullRecipe fullRecipe;

  const _Tags({ required this.fullRecipe});

  @override
  Widget build(BuildContext context) {
    List<String> tags  = fullRecipe.strTags.split(",");
    
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: tags.map((e) => Container(
            margin: const EdgeInsets.only(right: 10),
            child: Chip(
              label: Text(e),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )).toList(), // 🔥 Aquí está la corrección
        ),
      ),
    );
  }
}

class _TitleAndOverview extends StatelessWidget {
  
  final FullRecipe fullRecipe;
  final Size size;
  final TextTheme textStyles;

  const _TitleAndOverview({
    required this.fullRecipe,
    required this.size,
    required this.textStyles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              fullRecipe.strMealThumb,
              width: size.width*0.3,),
          ),

          const SizedBox(width: 10,),

          SizedBox(
            width: (size.width - 40 ) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullRecipe.strMeal, style: textStyles.titleLarge,),
                Text( fullRecipe.idMeal.substring(0,2) ),

                Text(fullRecipe.strTags, style: textStyles.titleLarge,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}


final isFavoriteProvider = FutureProvider.family.autoDispose((ref, String recipeId){
  final localStorageRepository =  ref.watch(localStorageProvider);
  return localStorageRepository.isRecipeFavorite(recipeId);
});


class _CustomSliverAppBar extends ConsumerWidget{
  final FullRecipe fullRecipe;

  const _CustomSliverAppBar({
    required this.fullRecipe
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final isFavoriteFuture = ref.watch(isFavoriteProvider(fullRecipe.idMeal));

    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: ()async{
            await ref.read(favoritesRecipesProviders.notifier)
              .toogleFavorite(fullRecipe);
            ref.invalidate(isFavoriteProvider(fullRecipe.idMeal));
          },
          icon: isFavoriteFuture.when(
            loading: () => const CircularProgressIndicator(strokeWidth: 2,),
            data: (isFavorite) => isFavorite
              ? const Icon(Icons.favorite_rounded, color: Colors.red)
              : const Icon(Icons.favorite_border),
            error: (_,__) => throw UnimplementedError()
          ),
        ),

      ],

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(bottom: 0),
        title: CustomGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const[0.7, 0.1],
          colors: [
            Colors.transparent,
            scaffoldBackgroundColor
          ],
        ),

        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                fullRecipe.strMealThumb,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress != null) return const SizedBox();

                  return FadeIn(child: child);
                },
              ),
            ),

            const CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [
                Colors.black54,
                Colors.transparent
              ],
            ),


            const CustomGradient(
              begin: Alignment.topLeft,
              stops: [0.0, 0.3],
              colors: [
                Colors.black87,
                Colors.transparent
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class CustomGradient extends StatelessWidget {

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const CustomGradient({
    super.key, 
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors
          )
        ),
      ),
    );
  }
}