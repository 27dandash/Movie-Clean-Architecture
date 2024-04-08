import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/core/usecase/base_usecase.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean_arc/movies/domain/repositories/base_movies_repositories.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParams> {
  BaseMoviesRepositories basemoviesrepositories;

  GetMovieDetailUseCase(this.basemoviesrepositories);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParams params) async {
    return await basemoviesrepositories.getMovieDetails(params);
  }
}

class MovieDetailParams extends Equatable {
  final int movieId;

  const MovieDetailParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
