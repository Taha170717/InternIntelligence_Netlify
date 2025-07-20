class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final String description;
  final double rating;
  final List<String> genres;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.description,
    required this.rating,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      posterUrl: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
          : '',
      description: json['overview'] ?? 'No description',
      rating: (json['vote_average'] is int)
          ? (json['vote_average'] as int).toDouble()
          : (json['vote_average'] ?? 0.0),
      genres: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids']).map((id) => _genreMap[id] ?? 'Unknown').toList()
          : [],
    );
  }
}

const Map<int, String> _genreMap = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  99: 'Documentary',
  18: 'Drama',
  10751: 'Family',
  14: 'Fantasy',
  36: 'History',
  27: 'Horror',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Sci-Fi',
  10770: 'TV Movie',
  53: 'Thriller',
  10752: 'War',
  37: 'Western',
};
