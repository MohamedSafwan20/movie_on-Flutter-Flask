import 'package:flutter/material.dart';
import 'package:movie_on/ui/widgets/movie_list_item.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const MovieListItem();
          }),
    );
  }
}
