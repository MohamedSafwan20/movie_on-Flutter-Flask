part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetail movie;

  MovieDetailsLoaded({required this.movie});
}

class MovieDetailsError extends MovieDetailsState {}
