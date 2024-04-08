import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_clean_arc/core/error/execeptions.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/core/network/api_constants.dart';
import 'package:movie_clean_arc/core/network/error_message_model.dart';
import 'package:movie_clean_arc/core/utils/app_constants.dart';
import 'package:movie_clean_arc/movies/data/models/movie_detail_model.dart';
import 'package:movie_clean_arc/movies/data/models/movie_model.dart';
import 'package:movie_clean_arc/movies/data/models/recommendation_model.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_recommendation_usecase.dart';


abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailParams parms);
  Future<List<Recommendation>> getRecommendation(RecommendationParameters parms);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response = await Dio().get(
        ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(
        ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailParams parms)async {
    final response = await Dio().get(
        ApiConstants.movieDetailsPath(parms.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parms)async {
    final response = await Dio().get(
        ApiConstants.recomnadionPath(parms.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
