
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/repositories/local_storage_repository_impl.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_procider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../providers/actors/actors_by_movie_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const name = 'movie-screen';

  final String movieId;
  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();
    
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  

  @override
  Widget build(BuildContext context) {

    final Movie? movie = ref.watch( movieInfoProvider )[widget.movieId];

    if(movie == null){
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2,),
      );
    }
    /*
    final movies = ref.watch(movieInfoProvider);RETURNS MAP <STRING, MOVIE>
    final movie = movies[MOVIEID] RETURN THE MOVIE WITH THAT ID
    */
    
    print("Movie id: ${movie?.id}");
    return  Scaffold(
      
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        
        slivers: [
          _CustomSliverAppbar(movie: movie),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _MovieDetails(movie: movie),
            childCount: 1
          )),
        ],
      ),
    );
  }
}



class _MovieDetails extends StatelessWidget {
  
  const _MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.30,
                ),
              ),


              const SizedBox(width: 10,),


              SizedBox(
                width: (size.width-40) * 0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textStyle.titleLarge,),
                    Text(movie.overview)
                  ],
                ),
              )
            ],
          ),
        ),

        
        Padding(padding: const EdgeInsets.all(8),
        child: Wrap(
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  label: Text(gender),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20))
                ),
              ))
            ],
          ),
        ),


        
        _ActorsByMovie(movieId: movie.id.toString() ),

        const SizedBox(height: 50,)
      ],
    );
  }
}


class _ActorsByMovie extends ConsumerWidget {
  
  const _ActorsByMovie({
    super.key, required this.movieId
  });

  final String movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final actorsByMovieId = ref.watch(actorsByMovieProvider);

    if(actorsByMovieId[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2,);
    }


    final actors = actorsByMovieId[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length ,
        itemBuilder: (BuildContext context, int index) {
          final actor = actors[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //acctor photo
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      actor.profilePath,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //actor name
                const SizedBox( height: 5, ),
                Text(actor.name, maxLines: 2,),
                Text(actor.character ??'', maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}

//* this provider emits a bool and gets an int
final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId){
  final localStorageRepository = ref.watch(localStorageProvider).isMovieFavorite(movieId);
  return localStorageRepository;
});


class _CustomSliverAppbar extends ConsumerWidget {

  const _CustomSliverAppbar({
    super.key,
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isFavoriteFuture = ref.watch(isFavoriteProvider(movie.id));//argument of the provider

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 0.70 * size.height,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      actions: [
        IconButton(
          
          onPressed: () async{
            //ref.read(localStorageProvider).toggleFavorite(movie);
            await ref.read(favoritesMoviesProviders.notifier).toggleFavorite(movie);
            ref.invalidate(isFavoriteProvider(movie.id));
          },
          icon: isFavoriteFuture.when(
            loading: () => const  CircularProgressIndicator(strokeWidth: 3,),
            data: (isFavorite) => isFavorite ?
                const Icon(Icons.favorite_rounded, color:  Colors.red,)
                : const Icon(Icons.favorite_border)
              ,
            error: (error, stackTrace) => throw UnimplementedError(stackTrace.toString()),
          )
          //icon: Icon(Icons.favorite_border)
          //icon: Icon(Icons.favorite_rounded, color:  Colors.red,)
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        //HIDE MOVIE TITLE
        //title: Text( movie.title, style: const TextStyle(fontSize: 20,), textAlign: TextAlign.start, ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null){
                    return const SizedBox();
                  }else{
                    return FadeIn(child: child);
                  }
                },
              ),
            ),

            const _CustomGradient(
              stops: [0.0, 0.2],
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            ),


            const _CustomGradient(
              stops: [0.7, 1.0],
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),


            const _CustomGradient(
              stops: [0.0, 0.4],
              colors: [Colors.black87, Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.centerRight
            ),
          ],
        ),
      ),


    );
  }
}

class _CustomGradient extends StatelessWidget {
  const _CustomGradient({
    super.key,
    required this.stops,
    required this.colors,
    required this.begin,
    required this.end
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors
          )
        ),
      ),
    );
  }
}