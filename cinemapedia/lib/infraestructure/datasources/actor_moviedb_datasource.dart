import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import '../../domain/entities/actor.dart';
import '../mappers/actor_mapper.dart';
import '../models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDataSource{

  final Dio dio = Dio(
    BaseOptions(
      baseUrl:  'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-Mx'
      }
    )
  );
  


  @override
  Future<List<Actor>> getActorsByMovie(String movieId)async {
    final response = await dio.get('/movie/$movieId/credits');

    final actorsCastResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = actorsCastResponse.cast
      //.where((castActor) => castActor.profilePath != null) always has an image
      .map((castActor) => ActorMapper.CastToEntity(castActor) ).toList();
    
    return actors;
  }

  

}