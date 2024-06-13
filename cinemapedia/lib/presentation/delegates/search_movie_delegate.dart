
import 'dart:async';


import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_procider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//each time the user writes something everytihng triggers

typedef SearchMoviesCallback = Future<List<Movie>>Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?>{
  //previous movies
  List<Movie> initialMovies;

  final SearchMoviesCallback searchMovies;
  //multiple listeners for this stream
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();

  StreamController<bool> isLoadingStream = StreamController.broadcast();

  //emite value when the user stopped entering data for a given time
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies,
    required this.initialMovies
  });

  void clearStreams(){
    debouncedMovies.close();
    isLoadingStream.close();
  }

  void _OnQueryChanged(String query){
    //query string changed
    if(_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    //now the query stirng changes N times,
    //and waites 700 millis since user's last input and then make http request
    isLoadingStream.add(true);
    _debounceTimer = Timer(const Duration(milliseconds: 500),()async {
        //search movie
        //if(query.isEmpty){
        //  debouncedMovies.add([]);//data stream
         // return; //dont wana make http request if queri is empty
        //}
        isLoadingStream.add(false);
        final movies = await searchMovies(query);
        debouncedMovies.add(movies);
        initialMovies = movies;
        
    });
    
  }

  Widget buildResultsAndSuggestions(){
    return StreamBuilder(
      initialData: initialMovies,
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie){
                clearStreams();
                close(context, movie);
              }
            );
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => "Buscar Película";

  @override
  List<Widget>? buildActions(BuildContext context) {
    //botón de la derecha
    return [
    StreamBuilder(
      stream: isLoadingStream.stream,
      builder: (context, snapshot) {
        final bool isLoading = snapshot.data!;
        if (isLoading == true){
          return SpinPerfect(
            animate: query.isNotEmpty,
            infinite: true,
            spins: 5,
            duration: const Duration(seconds: 5),
            child: IconButton(
              onPressed: ()=> query = '',
              icon: const Icon(Icons.refresh_rounded)
            ),
          );
        }else{
          return FadeInRight(
            animate: query.isNotEmpty,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              onPressed: ()=> query = '',
              icon: const Icon(Icons.clear)
            ),
          );
        }
      },
    )

    ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    //back button start of the screen
      return IconButton(
        onPressed: (){
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back) ,
      );
  }


  @override
  Widget buildResults(BuildContext context) {
    
    return buildResultsAndSuggestions();
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    //list of movies
    //avoid to call this future each time a key is pressed

    //this function will be invoked too many times
    _OnQueryChanged(query);
    return buildResultsAndSuggestions();
  }

}

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie, required this.onMovieSelected});

  final Movie movie;
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of( context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            
            SizedBox(
              width: size.width * 0.20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath,
                  loadingBuilder:(context, child, loadingProgress) => FadeIn(child: child),
                ),
              ),
            ),
      
            const SizedBox(width: 10 ),
      
            SizedBox(
              width: size.width*0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyle.titleMedium,),
      
                  ( movie.overview.length > 100)
                    ? Text(movie.overview.substring(0,50))
                    : Text(movie.overview) ,
      
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                      SizedBox(width: 5, ),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                      )
                    ],
                  ),
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}