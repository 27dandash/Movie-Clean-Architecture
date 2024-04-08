import 'package:dartz/dartz.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/core/usecase/base_usecase.dart';
import 'package:movie_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_clean_arc/movies/domain/repositories/base_movies_repositories.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>,NoParams>{
  final BaseMoviesRepositories basemoviesrepositories;

  GetPopularMoviesUseCase(this.basemoviesrepositories);

  @override
  Future<Either<Failure,List<Movies>>> call(NoParams params) async{
    return await basemoviesrepositories.getPopularMovies();
  }
}