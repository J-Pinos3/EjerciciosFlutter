import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource{

  //http client
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }
    )
  );


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{

    final response = await dio.get('/movie/now_playing'); 

    final movieDbResponse = MovieDbResponse.fromJson(response.data);//get json

    //map the json to movie entity
    final List<Movie> movies = movieDbResponse.results
    .where((movieDb) => movieDb.posterPath != 'no-poster')//filter movies with no poster
    .map(
      (movieDb) => MovieMapper.movieDbToEntity(movieDb)
    ).toList();

    return movies;
  }

}