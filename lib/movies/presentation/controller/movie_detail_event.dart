part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}



class GetMovieDetailEvent extends MovieDetailEvent {
  final int movieId;

 const GetMovieDetailEvent( this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetMovieRecomnendationEvent extends MovieDetailEvent {
  final int id;

  const GetMovieRecomnendationEvent( this.id);

  @override
  List<Object> get props => [id];
}