import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statuscode;
  final String statusmessage;
  final bool success;

 const ErrorMessageModel(
      {required this.statuscode, required this.statusmessage, required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic>json){
    return ErrorMessageModel(
        statuscode:  json['statuscode'],
        statusmessage:  json['statusmessage'],
        success: json['success'],);

  }

  @override
  List<Object?> get props => [statuscode,statusmessage,success ];
}
