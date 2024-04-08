import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean_arc/core/error/failure.dart';
import 'package:movie_clean_arc/core/usecase/base_usecase.dart';
import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';
import 'package:movie_clean_arc/movies/domain/repositories/base_movies_repositories.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {

  final BaseMoviesRepositories baseMoviesRepositories;
      GetRecommendationUseCase(this.baseMoviesRepositories);

  @override
  Future<Either<Failure,List< Recommendation>>> call(

      RecommendationParameters params) async{
  return await baseMoviesRepositories.getRecommendation(params);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
