import '../../domain/entities/actor.dart';
import '../../infraestructure/models/moviedb/credits_response.dart';

class ActorMapper{

  static Actor CastToEntity(Cast castActors) => Actor(
    id: castActors.id,
    name: castActors.name,
    profilePath: castActors.profilePath == null ? 
    "https://easimages.basnop.com/default-image_600.png" 
    : 'https://image.tmdb.org/t/p/w500/${castActors.profilePath}',
    character: castActors.character
  );


}