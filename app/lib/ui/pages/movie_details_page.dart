import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/config/colors.dart';
import 'package:movie_on/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_on/data/models/movie_detail_model.dart';
import 'package:movie_on/ui/widgets/app_bar.dart';
import 'package:movie_on/ui/widgets/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    BlocProvider.of<MovieDetailsCubit>(context).fetchMovie(title: widget.title);

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsError) {
                return SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        child: CustomAppBar(
                          title: "Movie Detail",
                        ),
                      ),
                      Container(
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
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                );
              }

              if (state is MovieDetailsLoaded) {
                final MovieDetail movie = state.movie;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: CustomAppBar(
                        title: "Movie Detail",
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
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
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              movie.image,
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
                          children: [
                            Text(
                              movie.name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Genres: ${movie.genres}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        movie.description,
                        style: const TextStyle(height: 1.3),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 40.0, left: 40, top: 20),
                      child: Text(
                        "Streaming Links",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              movie.streamingLinks.asMap().entries.map((entry) {
                            int index = entry.key;
                            String link = entry.value;

                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "Server ${index + 1}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => launch(link),
                                    child: Text(
                                      link,
                                      style: const TextStyle(
                                          color: SECONDARY_COLOR,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )),
                  ],
                );
              }

              return SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: CustomAppBar(
                        title: "Movie Detail",
                      ),
                    ),
                    Loading(
                      size: 30,
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
