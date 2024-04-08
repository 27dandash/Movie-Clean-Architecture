import 'package:movie_clean_arc/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const ServerException({required this.errorMessageModel});
}

class LocalDatabaseExecption implements Exception{
  final String errorMessageModel;

  const LocalDatabaseExecption({required this.errorMessageModel});
}