//*local storage datasource
import 'package:isar/isar.dart';

import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource{
  
  late Future<Isar> db;

  IsarDatasource(){
    db = OpenDB();
  }

  Future<Isar>OpenDB() async{
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieDd) async {
    final isar =  await db;
    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieDd)
      .findFirst();

    return isFavoriteMovie != null;
  }


  @override
  Future<void> toggleFavorite(Movie movie) async{
    final isar = await db;
    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if( favoriteMovie != null){
      //delete fav movie from db
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }
    //insert fav movie in db
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) async{
    final isar = await db;
    return isar.movies.where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }

}