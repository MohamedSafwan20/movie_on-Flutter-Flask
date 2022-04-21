import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_on/data/repositories/movie_details_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepository repository;

  MovieDetailsCubit({required this.repository}) : super(MovieDetailsInitial());

  void fetchMovie({required String title}) {
    repository.fetchMovie(title: title);
  }
}
