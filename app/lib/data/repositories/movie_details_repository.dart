import 'package:movie_on/data/models/movie_detail_model.dart';
import 'package:movie_on/data/services/network_service.dart';

class MovieDetailsRepository {
  NetworkService networkService;

  MovieDetailsRepository({required this.networkService});

  Future<MovieDetail> fetchMovie({required String title}) async {
    dynamic data = await networkService.fetchMovie(title: title);
    MovieDetail movie = MovieDetail.fromJson(data);

    return movie;
  }
}
