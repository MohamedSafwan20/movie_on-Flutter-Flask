import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/cubits/home_cubit/home_cubit.dart';
import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/ui/widgets/loading.dart';
import 'package:movie_on/ui/widgets/search_list.dart';

import '../../config/colors.dart';
import '../widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  bool isSearchListOpen = false;
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeCubit>(context).fetchMovies();
  }

  void searchMovie() {
    filteredMovies = BlocProvider.of<HomeCubit>(context)
        .search(list: movies, keyword: _searchController.text) as List<Movie>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSearchListOpen = false;
            });
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
                child: Column(
                  children: [
                    TextField(
                      onChanged: (_) {
                        setState(() {
                          isSearchListOpen = true;
                        });
                        searchMovie();
                      },
                      onEditingComplete: () {
                        setState(() {
                          isSearchListOpen = false;
                        });
                      },
                      controller: _searchController,
                      cursorColor: TEXT_COLOR,
                      decoration: const InputDecoration(
                        fillColor: PRIMARY_VARIANT_COLOR,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.search,
                          color: TEXT_COLOR,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.transparent),
                        ),
                      ),
                    ),
                    isSearchListOpen
                        ? SearchList(
                            movies: filteredMovies,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 34.0, vertical: 40),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Latest ",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "Movies",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w300)),
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
                    movies = (state).movies;

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
      ),
    );
  }
}
