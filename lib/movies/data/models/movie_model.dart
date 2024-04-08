import 'package:movie_clean_arc/movies/domain/entities/movie.dart';

class MovieModel extends Movies {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genderIds,
      required super.overView,
      required super.releaseDate,
      required super.voteAverage});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
      return MovieModel(
          id: json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          genderIds:
          List<int>.from(json['genre_ids']).map((e) => e as int).toList(),
          overView: json['overview'],
          releaseDate: json['release_date'],
          voteAverage: json['vote_average'].toDouble(),
      );

  }


}
