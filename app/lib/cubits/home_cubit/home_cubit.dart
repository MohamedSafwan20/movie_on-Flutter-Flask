import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_on/data/repositories/home_repository.dart';

import '../../data/models/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit({required this.repository}) : super(HomeInitial());

  void fetchMovies() {
    repository.fetchMovies().then((movies) {
      return emit(HomeLoaded(movies: movies));
    }).catchError((e) => emit(HomeError()));
  }

  List search({required List list, required String keyword}) {
    final filteredList = list
        .where((movie) => movie.name
            .trim()
            .toUpperCase()
            .contains(keyword.trim().toUpperCase()))
        .toList();

    return filteredList;
  }
}
