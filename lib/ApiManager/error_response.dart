import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {

  int code;
  String message;
  int statusCode;

  ErrorResponse(this.code, this.message, this.statusCode);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson( instance) => _$ErrorResponseToJson(this);

}
