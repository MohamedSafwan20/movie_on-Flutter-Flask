import 'package:flutter/material.dart';
import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/ui/widgets/search_list_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return SearchListItem(
              movie: movies[index],
            );
          }),
    );
  }
}
