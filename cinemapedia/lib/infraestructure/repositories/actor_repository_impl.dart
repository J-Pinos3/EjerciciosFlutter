import '../../domain/datasources/actors_datasource.dart';
import '../../domain/entities/actor.dart';
import '../../domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository{
  final ActorsDataSource actorsDataSource;

  ActorRepositoryImpl(this.actorsDataSource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDataSource.getActorsByMovie(movieId);
  }

  
}