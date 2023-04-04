// import 'package:dio/dio.dart';
// import 'package:final_project/controller/dio/endpoint.dart';
//
// class DioHelper {
//   static late Dio dio;
//
//   init() {
//     dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
//       'Accept': 'application/json',
//       'Content-Type': "application/json",
//       'lang': 'en',
//     }));
//   }
//
//   static Future<Response> getData(
//       {required String url,
//       Map<String, dynamic>? queryParameters,
//       String? Token}) async {
//     Response response = await dio.get(url, queryParameters: queryParameters);
//     return response;
//   }
//
//   static Future<Response> postData(
//       {required String url,
//       required Map<String, dynamic> data,
//       String? token,
//       ProgressCallback? onSendProgress,
//       ProgressCallback? onReceiveProgress}) async {
//     final Response response = await dio.post(
//       url,
//       data: data,
//       onReceiveProgress: onReceiveProgress,
//       onSendProgress: onSendProgress,
//     );
//     return response;
//   }
//
//   static Future<Response> deleteDate({
//     required String url,
//     Map<String, dynamic>? data,
//     required String token,
//   }) async {
//     final Response response = await dio.delete(
//       url,
//       data: data,
//     );
//     return response;
//   }
// }














import 'package:dio/dio.dart';

import '../constants/endpoints.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = 'http://134.209.132.80/api/';

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: 30000,
          sendTimeout: 3,
          receiveTimeout: 30000
      ),
    );
  }

  static Future<Response> postData(
      {
        required String endPoint,
        Map<String, dynamic>? data,
        String? token
      }
      ) async {
    dio!.options.headers = {

      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio!.post(endPoint, data: data);
  }

  static Future<Response> getData(
      {required String endPoint,
        String? token,
        Map<String, dynamic>? header
      }
      ) async {
    dio!.options.headers = header ??
        {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${EndPoint.userToken}",
        };
    return await dio!.get(endPoint);
  }

  static Future<Response> putData(
      {
        required String endPoint,
        Map<String, dynamic>? data,
        String? token
      }
      ) async {
    dio!.options.headers = {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio!.put(endPoint, data: data);
  }
}




























