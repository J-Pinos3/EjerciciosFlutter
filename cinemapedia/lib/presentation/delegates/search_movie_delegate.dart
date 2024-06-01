
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?>{

  @override
  String get searchFieldLabel => "Buscar Película";

  @override
  List<Widget>? buildActions(BuildContext context) {
    //botón de la derecha
    return [
      
      //if( query.isNotEmpty )
      FadeInRight(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          onPressed: ()=> query = '',
          icon: const Icon(Icons.clear)
        ),
      )

    ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    //back button start of the screen
      return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back) ,
      );
  }


  @override
  Widget buildResults(BuildContext context) {
    return const Text("Build Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("Build Suggestions");
  }


}