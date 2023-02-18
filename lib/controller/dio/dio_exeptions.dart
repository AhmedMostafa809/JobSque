import 'package:dio/dio.dart';

class DioException implements Exception{
  String? message;
  DioException.fromDioError(DioError dioError){
    switch(dioError.type){
      case DioErrorType.cancel:
        message = 'Request to API server was canceled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Connection timeout';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection';
        break;
      case DioErrorType.response:
        message = handleError(dioError.response!.statusCode, dioError.response!.data);
        break;
    }

  }
  String handleError(int? stat,dynamic error){
    switch(stat){
      case 400:return error['message'];
      case 401 :return error['unoutharized'];
      case 403:return error['forbidden'];
      default : return 'oops';

    }

  }
}