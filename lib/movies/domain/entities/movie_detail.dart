import 'package:equatable/equatable.dart';

import 'geners.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final List<Genres> genres;
  final String backdropPath;
  final String overView;
  final String releaseDate;
  final int runtime;
  final double voteAverage;

  MovieDetail( {required this.voteAverage,
    required this.id,
    required this.title,
    required this.genres,
    required this.backdropPath,
    required this.overView,
    required this.releaseDate,
    required this.runtime,
  });

  List<Object> get props => [
        id,
        title,
        genres,
        backdropPath,
        overView,
        releaseDate,
        runtime,
        voteAverage,
      ];
}
