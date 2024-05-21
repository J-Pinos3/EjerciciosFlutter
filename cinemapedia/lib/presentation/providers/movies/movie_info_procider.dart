

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref){
  final fetchMovieById = ref.watch(moviesRepositoryProvider).getMovieByID;
  return MovieMapNotifier(
    getMovie: fetchMovieById
  );
});


//use case
typedef GetMovieCallBack = Future<Movie> Function(String movieID);

/*ID      MOVIE
  '1234': Movie()
  '1254': Movie()
  '1234': Movie()
*/

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{
  MovieMapNotifier({
    required this.getMovie
  }):super({});

  final GetMovieCallBack getMovie;

  Future<void> loadMovie(String movieId) async{
    if( state[movieId] != null ){ return; }

    final movie = await getMovie(movieId);

    state = { ...state, movieId: movie };
  }



}