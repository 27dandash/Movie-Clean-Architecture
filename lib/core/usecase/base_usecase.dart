import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie.dart';

abstract class BaseUseCase<T, Parameters> {
  // Future<T> call(P params);
  Future <Either<Failure, T>> call(Parameters params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}