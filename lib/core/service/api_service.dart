import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum DioMethod { post, get, put, delete }

class APIService {
  APIService._singleton();

  static final APIService instance = APIService._singleton();

  Future<Response> request(String endpoint, DioMethod method,
      {Map<String, dynamic>? param,
      String? contentType,
      formData,
      token}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          receiveTimeout: const Duration(seconds: 5),
          connectTimeout: const Duration(seconds: 5),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}

Future<void> makeApiRequest(String email, String password) async {
  try {
    final response = await APIService.instance.request(
      '/api/endpoint',
      DioMethod.post,
      param: {'email': email, 'password': password},
      contentType: 'application/json',
    );
    if (response.statusCode == 200) {
      print('API call successful: ${response.data}');
    } else {
      print('API call failed: ${response.statusMessage}');
    }
  } catch (e) {
    print('Network error occurred: $e');
  }
}
