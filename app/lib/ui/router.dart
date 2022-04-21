import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/config/routes.dart';
import 'package:movie_on/cubits/home_cubit/home_cubit.dart';
import 'package:movie_on/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_on/data/repositories/home_repository.dart';
import 'package:movie_on/data/repositories/movie_details_repository.dart';
import 'package:movie_on/data/services/network_service.dart';
import 'package:movie_on/ui/pages/home_page.dart';
import 'package:movie_on/ui/pages/movie_details_page.dart';

class AppRouter {
  late HomeRepository homeRepository;
  late MovieDetailsRepository movieDetailsRepository;

  AppRouter() {
    homeRepository = HomeRepository(networkService: NetworkService());
    movieDetailsRepository = MovieDetailsRepository(networkService: NetworkService());
  }

  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;

    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => HomeCubit(repository: homeRepository),
                  child: const HomePage(),
                ));

      case MOVIE_DETAILS_ROUTE:
        return MaterialPageRoute(builder: (e) =>
            BlocProvider(
              create: (context) => MovieDetailsCubit(repository: movieDetailsRepository),
              child: MovieDetailsPage(title: args["title"],),
            ));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => HomeCubit(repository: homeRepository),
                  child: const HomePage(),
                ));
    }
  }
}
