part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeError extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> movies;

  HomeLoaded({required this.movies});
}
