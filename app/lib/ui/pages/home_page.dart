import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/cubits/home_cubit/home_cubit.dart';
import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/ui/widgets/loading.dart';

import '../../config/colors.dart';
import '../widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).fetchMovies();

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0, vertical: 40),
                child: Text(
                  "Browse Movies",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              width: 320,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: PRIMARY_VARIANT_COLOR,
                  offset: Offset(
                    0.1,
                    0.1,
                  ),
                  blurRadius: 0,
                  spreadRadius: 2,
                ), //BoxShadow
                BoxShadow(
                  color: PRIMARY_COLOR,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ]),
              child: TextField(
                cursorColor: TEXT_COLOR,
                decoration: InputDecoration(
                  fillColor: PRIMARY_VARIANT_COLOR,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: TEXT_COLOR,
                    ),
                    onPressed: () {},
                    splashRadius: 0.1,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34.0, vertical: 40),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Latest ",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "Movies",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w300)),
                ])),
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeError) {
                  return Container(
                    width: 220,
                    padding: const EdgeInsets.symmetric(vertical: 70.0),
                    child: const Text(
                      "Something went wrong",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: DISABLED_COLOR),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state is HomeLoaded) {
                  List<Movie> movies = (state).movies;

                  return MovieList(movies: movies);
                }

                return const Loading(
                  size: 30,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
