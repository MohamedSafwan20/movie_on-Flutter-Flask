import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _BASE_URL = dotenv.get("API_URL");

  void fetchMovies() async {
    http.Response res = await http.get(Uri.parse("${_BASE_URL}/movies"));
    print(res.body);
  }
}
