//reads the model and then creates the apps entities

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper{

  static Movie movieDbToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') ?
    'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
    :'https://easimages.basnop.com/default-image_600.png',  
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), 
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity:moviedb. popularity,
    posterPath: (moviedb.posterPath != '')?
    'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
    :'no-poster',//'https://easimages.basnop.com/default-image_600.png',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
    );


}