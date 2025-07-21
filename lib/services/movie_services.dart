import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  final String apiKey = 'ea2c096c26e1a0b7ca194dad61787931';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getRecommendedMovies(int movieId) async {
    final url = Uri.parse('$baseUrl/movie/$movieId/recommendations?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> movieList = jsonData['results'];
      return movieList.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load recommended movies From API');
    }
  }

  Future<void> addMovieReview(String movieId, double rating, String review) async {
    await Future.delayed(Duration(seconds: 1));
    print("Review added: $review, rating: $rating, movie ID: $movieId");
  }
}
