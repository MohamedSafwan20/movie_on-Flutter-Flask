import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_on/config/routes.dart';
import 'package:movie_on/cubits/home_cubit/home_cubit.dart';
import 'package:movie_on/ui/pages/home_page.dart';
import 'package:movie_on/ui/pages/movie_details_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomePage(),
                ));

      case MOVIE_DETAILS_ROUTE:
        return MaterialPageRoute(builder: (_) => const MovieDetailsPage());

      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomePage(),
                ));
    }
  }
}
