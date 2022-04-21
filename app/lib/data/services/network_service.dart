import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _BASE_URL = dotenv.get("API_URL");

  Future<List> fetchMovies() async {
    http.Response res = await http.get(Uri.parse("$_BASE_URL/movies"));
    final data = jsonDecode(res.body);

    if (data["status"] != 1) {
      throw Exception(data["msg"]);
    }

    List movies = data["data"];

    return movies;
  }

  void fetchMovie({required String title}) async {
    http.Response res =
        await http.get(Uri.parse("$_BASE_URL/movie?title=$title"));
    final data = jsonDecode(res.body);

    if (data["status"] != 1) {
      throw Exception(data["msg"]);
    }

    List links = data["data"];

    return movies;
  }
}
