import 'package:dartz/dartz.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepositories{
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movies>>> getPopularMovies();
  Future<Either<Failure,List<Movies>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailParams parms);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(
      RecommendationParameters  parms
      );
}