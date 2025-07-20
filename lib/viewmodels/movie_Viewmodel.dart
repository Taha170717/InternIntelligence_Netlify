import 'package:flutter/material.dart';
import 'package:netlify/services/movie_services.dart';
import '../models/movie.dart';

class MovieViewModel extends ChangeNotifier {
  List<Movie> movieList = [];
  bool isLoading = false;

  MovieViewModel() {
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    isLoading = true;
    notifyListeners();

    movieList = await MovieService().getRecommendedMovies(550);

    isLoading = false;
    notifyListeners();
  }

  Future<void> addReview(String movieId, double rating, String review) async {
    await MovieService().addMovieReview(movieId, rating, review);
    notifyListeners();
  }

  List<Movie> get getMovies => movieList;
}
