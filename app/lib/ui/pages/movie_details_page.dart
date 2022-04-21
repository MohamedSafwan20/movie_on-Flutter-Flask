import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/config/colors.dart';
import 'package:movie_on/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_on/ui/widgets/app_bar.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieDetailsCubit>(context).fetchMovie(title: widget.title);

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: CustomAppBar(
                  title: "Movie Detail",
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: PRIMARY_VARIANT_COLOR,
                      offset: Offset(
                        10,
                        10,
                      ),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ), //BoxShadow
                    BoxShadow(
                      color: PRIMARY_COLOR,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://picsum.photos/200/300",
                        width: 240,
                        height: 320,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "MOVIE TITLE",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Genres: Comedy",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Kallan D’Souza and his friend, get by in life committing petty thefts. CI Manoj is a corrupt police officer who confiscates a huge amount of hawala money, and plans to pocket a big portion of it with his team, rather than turning it in.",
                  style: TextStyle(height: 1.3),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 40.0, left: 40, top: 20),
                child: Text(
                  "Streaming Links",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Server 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            Text(
                              "Kallan D’Souza (2022) Malayalam Full Movie Watch Online Free *Rip File*",
                              style: TextStyle(
                                  color: SECONDARY_COLOR,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Server 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            Text(
                              "Kallan D’Souza (2022) Malayalam Full Movie Watch Online Free *Rip File*",
                              style: TextStyle(
                                  color: SECONDARY_COLOR,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
