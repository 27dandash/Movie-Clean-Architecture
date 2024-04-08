import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/core/utils/enums.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_clean_arc/movies/domain/use_cases/get_recommendation_usecase.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecomnendationEvent>(_getRecomnadtion);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final Either<Failure, MovieDetail> resulat =
        await getMovieDetailUseCase(MovieDetailParams(movieId: event.movieId));
    resulat.fold((l) {
      emit(
          state.copyWith(requestState: RequestState.error, message: l.message));
    }, (r) {
      emit(state.copyWith(
        movieDetail: r,
        requestState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getRecomnadtion(
      GetMovieRecomnendationEvent event, Emitter<MovieDetailState> emit) async {
    final resulat =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    resulat.fold((l) {
      emit(
          state.copyWith(
              recommendationsrequestState: RequestState.error,
              recommendationsmessage: l.message));
    }, (r) {
      emit(state.copyWith(
        recommendations: r,
        recommendationsrequestState: RequestState.loaded,
      ));
    });
  }
}
