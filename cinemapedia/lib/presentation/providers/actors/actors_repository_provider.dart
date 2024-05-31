import '../../../infraestructure/datasources/actor_moviedb_datasource.dart';
import '../../../infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//read only provider
final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(  ActorMovieDbDatasource() );
});