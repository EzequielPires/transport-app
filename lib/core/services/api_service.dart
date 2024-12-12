import 'package:app/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options.baseUrl = 'http://192.168.0.106:8080/';
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    dio.options.headers.remove('Authorization');
  }

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      print(e);
      throw ServerException(
        message: e.response?.data['message'] ?? 'Erro de servidor',
      );
    }
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.post(endpoint, data: data, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw ServerException(
          message: e.response?.data['message'] ??
              e.response?.data['error'] ??
              'Erro de servidor');
    }
  }

  Future<Map<String, dynamic>> put(String endpoint,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.put(endpoint, data: data, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw ServerException(
          message: e.response?.data['message'] ?? 'Erro de servidor');
    }
  }

  Future<Map<String, dynamic>> patch(String endpoint,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.patch(endpoint, data: data, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw ServerException(
          message: e.response?.data['message'] ?? 'Erro de servidor');
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.delete(endpoint, queryParameters: params);

      return response.data;
    } on DioException catch (e) {
      throw ServerException(
          message: e.response?.data['message'] ?? 'Erro de servidor');
    }
  }
}
