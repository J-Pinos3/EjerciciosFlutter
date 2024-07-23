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


final popularMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  final fetchMoreMovies = ref.watch( moviesRepositoryProvider ).getPopular;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getUpcoming;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getTopRated;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


//use case
typedef MovieCallBack = Future<List<Movie>> Function({int page});

//generic notifier will be used for other providers
//MoviesNotifier handles this state (List<Movie>)
//it will be used for other providers
class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage = 0;
  MovieCallBack fetchMoreMovies;
  bool isLoading = false;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async{
    //isLoading is used for making multiple requests of a new page
    if (isLoading) {
      return;
    }

    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies( page: currentPage ); 

    state = [...state, ...movies];
    //await for the state i.e. list of movies has been rendered in its completitude
    await Future.delayed(const Duration(microseconds: 300));
    isLoading = false;
  }

}