import 'package:get_it/get_it.dart';
import 'package:movie_clean_arc/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_clean_arc/movies/data/repositories/movie_repositories.dart';
import 'package:movie_clean_arc/movies/domain/repositories/base_movies_repositories.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movie_detail_bloc.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/use_cases/get_now_playing_movie_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {

  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    ///Repository
    sl.registerLazySingleton<BaseMoviesRepositories>(() =>
        MoviesRepositories(sl()));


    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>
        MovieRemoteDataSource());
  }
}