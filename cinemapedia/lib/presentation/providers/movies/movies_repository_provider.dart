import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//read only provider
final moviesRepositoryProvider = Provider((ref){

  return MovieRepositoryImpl( MoviedbDatasource() );
});