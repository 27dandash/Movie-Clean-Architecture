import 'package:movie_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie_detail.dart';

import 'geners_model.dart';

class MovieDetailsModel extends MovieDetail {
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.genres,
    required super.backdropPath,
    required super.overView,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage});


  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overView: json['overview'],
        runtime: json['runtime'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        genres: List<GenersModel>.from(json['genres'].map((x) => GenersModel.fromJson(x)),
        ));
  }
}
