import 'package:cinemapedia/domain/entities/movie.dart';

//repository calls the datasoyurce class
//repos allows me to change data sources
abstract class MoviesRepository{

  Future<List<Movie>>getNowPlaying({int page = 1});


}