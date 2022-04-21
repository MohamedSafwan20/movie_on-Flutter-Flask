import 'package:movie_on/data/models/movie_model.dart';
import 'package:movie_on/data/services/network_service.dart';

class MovieDetailsRepository {
  NetworkService networkService;

  MovieDetailsRepository({required this.networkService});

  void fetchMovie({required String title}) {
    networkService.fetchMovie(title: title);
  }

}
