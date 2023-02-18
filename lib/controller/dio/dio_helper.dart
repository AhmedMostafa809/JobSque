import 'package:dio/dio.dart';
import 'package:final_project/controller/dio/endpoint.dart';

class DioHelper {
  static late Dio dio;

  init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'Accept': 'application/json',
      'Content-Type': "application/json",
      'lang': 'en',
    }));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? queryParameters,
      String? Token}) async {
    Response response = await dio.get(url, queryParameters: queryParameters);
    return response;
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      String? token,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final Response response = await dio.post(
      url,
      data: data,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    return response;
  }

  static Future<Response> deleteDate({
    required String url,
    Map<String, dynamic>? data,
    required String token,
  }) async {
    final Response response = await dio.delete(
      url,
      data: data,
    );
    return response;
  }
}
