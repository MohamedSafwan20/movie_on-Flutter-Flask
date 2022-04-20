import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/data/services/network_service.dart';

class HomeRepository {
  NetworkService networkService;

  HomeRepository({required this.networkService});

  Future<List<Movie>> fetchMovies() async {
    List data = await networkService.fetchMovies();
    List<Movie> movies = data.map((e) => Movie.fromJson(e)).toList();

    return movies;
  }
}
