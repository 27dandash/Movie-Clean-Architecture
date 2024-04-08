import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_arc/core/usecase/base_usecase.dart';
import 'package:movie_clean_arc/core/utils/enums.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_now_playing_movie_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean_arc/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    // print(MoviesBloc(sl()));             //WithOut Using Service Locator fo movies bloc
    // print(sl<MoviesBloc>().hashCode);    //With Using of Service Locator fo movies bloc everytime create a object from moviebloc by using registerFactory not using registerLazySingleton
    // print(sl<GetNowPlayingMoviesUseCase>().hashCode);

    final result = await getNowPlayingMoviesUseCase(const NoParams() );

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message)), (r) {
      emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
          ));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final resulat = await getPopularMoviesUseCase(const NoParams() );
    resulat.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)), (r) {
      emit(state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
          ));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final resulat = await getTopRatedMoviesUseCase(const NoParams() );

    resulat.fold((l) {
      emit(state.copyWith(
          topRatedState: RequestState.error, topRatedMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
          ));
    });
  }
}
