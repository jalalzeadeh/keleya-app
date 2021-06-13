
import 'package:keley_app/ApiManager/error_response.dart';
import 'package:keley_app/Extensions/string_extensions.dart';


class ApiResponse<T> {
  final int? code;
  final T? data;
  late bool isSuccessful;
  String? codeMessageKey;

  ApiResponse({required this.code, this.data}) {
    initializeParameters();
  }

  /// general failure response
  ApiResponse.failed({this.code = -1, this.data}) {
    initializeParameters();
  }

  /// general success response
  ApiResponse.successful({this.code = 200, this.data}) {
    initializeParameters();
  }

  void initializeParameters() {
    // a response is successful if and only if the server code is 200
    isSuccessful = code == 200;

    // if a response is received from the server but it is unsuccessful
    // then an api error code is also received in addition to the server code
    //
    // set an error response message key according to the api code
    if (!isSuccessful) {
      switch (code) {
        case ResponseStatus.UNAUTHORIZED:
          codeMessageKey = 'version_too_old';
          break;

        default:
          codeMessageKey = 'connection_error';
          break;
      }
    }
  }
}


enum Status { COMPLETED, ERROR }

class ResponseStatus {
  static const UNAUTHORIZED = 401;


}
