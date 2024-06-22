import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constant.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    addInterceptors(dio!);
    return await dio?.get(url, queryParameters: query ?? null);
  }

  static Future<Response?> postData({
    required String url,
    String lang = 'en',
    String token = '',
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio?.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response?> postData2({
    required String url,
    required String lang,
    String token = '',
    required FormData data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio?.post(
      url,
      data: data,
    );
  }

  static Future<Response?> putData({
    required String url,
    String lang = 'en',
    String token = '',
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    addInterceptors(dio!);
    return await dio?.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response?> putData2({
    required String url,
    required String token,
    String lang = 'en',
    required FormData data,
  }) async {
    dio!.options.headers = {
      'Authorization': token,
      'lang': lang,
      'Content-Type': 'multipart/form-data',
    };
    addInterceptors(dio!);
    return await dio?.post(url, data: data); // Using POST with _method: "PUT"
  }

  static void addInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }
}
