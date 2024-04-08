import 'package:movie_clean_arc/movies/domain/entities/geners.dart';

class GenersModel extends Genres {

  const GenersModel({required super.id, required super.name});

  factory GenersModel.fromJson(Map<String, dynamic> json) {
    return GenersModel(
      id: json['id'],
      name: json['name'],
    );
  }
}