

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesMoviesProviders = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref){
  final loadNextPage = ref.watch( localStorageProvider );
  return StorageMoviesNotifier(localStorageRepo: loadNextPage);
});




class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>>{
  int page = 0;
  final LocalStorageRepository localStorageRepo;

  StorageMoviesNotifier({
    required this.localStorageRepo
  }):super({});

  Future<List<Movie>> loadNextPage( ) async{
    final movies = await localStorageRepo.loadMovies(offset: page*10, limit: 20);
    page++;

    //                    <int, Movie>{}
    final tempMoviesMap = Map<int, Movie>();
    
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async{
    await localStorageRepo.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if(isMovieInFavorites){
      state.remove(movie.id);
      state = {...state};
    }else{
      state = {...state, movie.id: movie};
    }
    
  }

}