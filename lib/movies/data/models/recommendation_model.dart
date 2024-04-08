import 'package:movie_clean_arc/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({required super.id, super.backdropPath});

factory RecommendationModel.fromJson(Map<String ,dynamic>json){
  return RecommendationModel(
    id:  json['id'],
    backdropPath: json['backdrop_path']??'/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg',
  );
}
}