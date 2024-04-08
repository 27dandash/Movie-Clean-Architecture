part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.message = '',
    this.recommendations = const[],
    this.recommendationsrequestState = RequestState.loading,
    this.recommendationsmessage = '',
  });

  final MovieDetail ? movieDetail;
  final RequestState movieDetailState;
  final String message;
  final List<Recommendation> ? recommendations;
  final RequestState recommendationsrequestState;
  final String recommendationsmessage;

  MovieDetailState copyWith({
    MovieDetail ? movieDetail,
    RequestState ? requestState,
    String ? message,
    List<Recommendation> ? recommendations,
    RequestState ? recommendationsrequestState,
    String ? recommendationsmessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: requestState ?? this.movieDetailState,
      message: message ?? this.message,
      recommendations: recommendations ?? this.recommendations,
      recommendationsrequestState: recommendationsrequestState ??
          this.recommendationsrequestState,
      recommendationsmessage: recommendationsmessage ??
          this.recommendationsmessage,
    );
  }


  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailState,
        message,
        recommendations,
        recommendationsrequestState,
        recommendationsmessage,
      ];
}

// final class MovieDetailInitial extends MovieDetailState {
//   @override
//   List<Object> get props => [];
// }
