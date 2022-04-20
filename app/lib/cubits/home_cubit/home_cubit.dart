import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_on/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit({required this.repository}) : super(HomeInitial());

  void fetchMovies() {
    repository.fetchMovies();
  }
}
