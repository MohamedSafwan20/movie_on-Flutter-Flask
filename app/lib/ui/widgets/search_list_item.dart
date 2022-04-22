import 'package:flutter/material.dart';
import 'package:movie_on/config/routes.dart';
import 'package:movie_on/data/models/movie_model.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MOVIE_DETAILS_ROUTE,
            arguments: {"title": movie.name});
      },
      child: Row(
        children: [
          SizedBox(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.image,
                  )),
            ),
          ),
          Text(
            movie.name.length > 22
                ? "${movie.name.substring(0, 22)}..."
                : movie.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
