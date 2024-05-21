import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = "home-screen";

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}




class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initalLoading = ref.watch(initialLoadingProvider);
    if(initalLoading){
      return const FullScreenLoader();
    } 

    final slideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    //in order to avoid overflow of childrens in pixels
    //wrap column or whatever Widget with SingleChildScrollView
    return CustomScrollView(
      slivers:[
      
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(top: 10),
          title: CustomAppBar(),
        ),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return      
              Column(
                children: [

                  MoviesSlideshow(
                    movies: slideShowMovies
                  ),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: "In Cinemas",
                    subTitle: "Monday 20th",
                    loadNextPage: (){
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                    }
                  ),


                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: "Soon",
                    subTitle: "February",
                    loadNextPage: (){
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    }
                  ),


                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: "Populars",
                    subTitle: "This month",
                    loadNextPage: (){
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                    }
                  ),


                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: "Top Rated",
                    subTitle: "2024",
                    loadNextPage: (){
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    }
                  ),

                  const SizedBox(height: 20,)
                ],
              );
          },
          childCount: 1
        )),
      ]
    );
  }
}