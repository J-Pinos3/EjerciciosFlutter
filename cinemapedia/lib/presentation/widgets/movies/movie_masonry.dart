import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../domain/entities/movie.dart';

class MovieMasonry extends StatefulWidget {

  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {

  final ScrollController masonryScrollController = ScrollController();


  @override
  void initState() {
    super.initState();

    masonryScrollController.addListener(() {
      if(widget.loadNextPage == null){
        return ;
      }
      //(masonryScrollController.position.pixels+500) >= masonryScrollController.position.maxScrollExtent
      if(masonryScrollController.position.pixels <= masonryScrollController.position.maxScrollExtent -30){
        widget.loadNextPage!();
      }
    });
  }



  @override
  void dispose() {
    masonryScrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: masonryScrollController,
        crossAxisCount: 3, //three columns
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if(index == 1){
            return Column(
              children: [
                const SizedBox(height: 20,),
                MoviePosterLink(movie: widget.movies[index])
              ],
            );
          }
          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }
}

