import 'dart:convert';
import 'package:acara36/model/popular_movies.dart';
import "package:http/http.dart" show Client, Response;

class ApiProvider {
  String apiKey = '7a72d04f0df700c7595038b342752f4f';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<Popularmovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return Popularmovies.fromjson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
