import 'package:movie_on/data/services/network_service.dart';

class HomeRepository {
  NetworkService networkService;

  HomeRepository({required this.networkService});

  void fetchMovies() {
    networkService.fetchMovies();
  }
}
