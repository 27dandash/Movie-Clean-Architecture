import 'package:dartz/dartz.dart';
import 'package:movie_clean_arc/core/error/execeptions.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';
import 'package:movie_clean_arc/movies/domain/repositories/base_movies_repositories.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_recommendation_usecase.dart';

class MoviesRepositories extends BaseMoviesRepositories {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepositories(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies()async {

   final resulat= await baseMovieRemoteDataSource.getNowPlayingMovies();
   try{
     return Right(resulat);

   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statusmessage));
   }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final resulat= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(resulat);

    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final resulat= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(resulat);

    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusmessage));
    }
   }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParams parms) async{
    final resulat= await baseMovieRemoteDataSource.getMovieDetails(parms);
    try{
      return Right(resulat);

    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parms) async{
    final resulat= await baseMovieRemoteDataSource.getRecommendation(parms);
    try{
      return Right(resulat);

    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusmessage));
    }
  }


}