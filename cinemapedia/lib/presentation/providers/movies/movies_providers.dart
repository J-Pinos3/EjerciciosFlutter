import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// StateNotifierProvider is an state(information)
//provider that notifies when state changes
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  
  final fetchMoreMovies = ref.watch( moviesRepositoryProvider ).getNowPlaying;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


//use case
typedef MovieCallBack = Future<List<Movie>> Function({int page});

//generic notifier will be used for other providers
//MoviesNotifier handles this state (List<Movie>)
class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async{
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies( page: currentPage ); 

    state = [...state, ...movies];
  }

}