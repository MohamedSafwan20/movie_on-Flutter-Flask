import 'package:flutter/material.dart';
import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/ui/widgets/movie_list_item.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieListItem(
              name: movies[index].name,
              image: movies[index].image,
            );
          }),
    );
  }
}
