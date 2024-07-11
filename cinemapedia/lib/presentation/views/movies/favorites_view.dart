

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/storage/favorites_movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPaage();
  }

  //TODO ADD PROGRESS INDICATOR
  void loadNextPaage() async{
    if(isLoading || isLastPage){
      return; 
    }

    isLoading = true;
    final movies = await ref.read(favoritesMoviesProviders.notifier).loadNextPage();
    isLoading = false;

    if(movies.isEmpty){
      isLastPage = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    //final favoriteMovies = ref.watch(favoritesMoviesProviders);
    //WHAT  I DID
    //List<int>movieIds = [];
    //favoriteMovies.forEach((key, value) { 
    //  movieIds.add( favoriteMovies[key]!.id);
    //});

    //fernando gets  a list of movies already done
    final favoriteMovies = ref.watch(favoritesMoviesProviders).values.toList();
  
    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Icon(Icons.favorite_border_sharp, size: 60, color: colors.primary,),
            Text("Oh no!",style: TextStyle(fontSize: 30, color: colors.primary),),
            const Text( "There're no movies in your favorites list",
              style: TextStyle(fontSize: 20, color: Colors.black45),),
            
            const SizedBox(height: 20,),

            FilledButton.tonal(
              onPressed: ()=> context.go("/home/0"),
              child: const Text("Start searching movies")
            )

          ],
        ),
      ); 
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites View"),
      ),
      body: MovieMasonry(
        loadNextPage: loadNextPaage,
        movies: favoriteMovies
      )
    );
  }
}


/*
ListView.builder(
          //        fvritMovies.length
          itemCount: movieIds.length,
          itemBuilder: (context, index) {
            return ListTile(
              //          fvritMovies[index]
              title: Text(favoriteMovies[ movieIds[index] ]!.title),
            );
          },
        )

 */