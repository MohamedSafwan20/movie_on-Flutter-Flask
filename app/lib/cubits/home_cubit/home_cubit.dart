import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_on/data/repositories/home_repository.dart';

import '../../data/models/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit({required this.repository}) : super(HomeInitial());

  void fetchMovies() {
    repository
        .fetchMovies()
        .then((movies) => emit(HomeLoaded(movies: movies)))
        .catchError((e) => emit(HomeError()));
  }
}
