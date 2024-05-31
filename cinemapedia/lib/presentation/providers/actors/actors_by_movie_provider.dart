

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref){
  final fetchActorsByMovieId = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorsByMovieNotifier(
    getActors: fetchActorsByMovieId
  );
});


//use case
typedef GetActorsCallback = Future< List<Actor> > Function(String movieID);

/*ID      List<Actor>
  '1234': <ACtor>[]
  '1254': <ACtor>[]
  '1234': <ACtor>[]
*/

class ActorsByMovieNotifier extends StateNotifier< Map<String, List<Actor>> >{
  ActorsByMovieNotifier({
    required this.getActors
  }):super({});

  final GetActorsCallback getActors;

  Future<void> loadActors(String movieId) async{
    if( state[movieId] != null ){ return; }
    print("doing http request o get crew");
    final List<Actor>actor = await getActors(movieId);

/*
  String actorsDetails = actor
  .map((actor) => 'Nome: ${actor.name}, Personagem: ${actor.character}')
  .join(", \n");
  print("Atores recebidos: \n$actorsDetails");
*/
    state = { ...state, movieId: actor };
  }



}