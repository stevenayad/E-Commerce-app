import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/cache_helper.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_interceptors.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );

    dio.interceptors.add(InterceptorsConsumer(dio: dio));

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // GET
  // ---------------------------------------------------------------------------
  @override
  Future<dynamic> get(String endpoint, Map<String, dynamic>? query) async {
    try {
      final response = await dio.get(endpoint, queryParameters: query);

      return response.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      rethrow;
    } catch (e, s) {
      print("🔥 Non-Dio Error: $e");
      print(s);
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  // POST
  // ---------------------------------------------------------------------------
  @override
  Future<dynamic> post(String endpoint, dynamic body, bool isFormData) async {
    try {
      final headers = <String, String>{'Accept': 'application/json'};

      if (isFormData) {
        headers.remove('Content-Type');
      } else {
        headers['Content-Type'] = 'application/json';
      }

      final response = await dio.post(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      print("❌ Response: ${e.response?.data}");
      rethrow;
    } catch (e, s) {
      print("🔥 Non-Dio Error: $e");
      print(s);
      return {'error': e.toString()};
    }
  }

  // ---------------------------------------------------------------------------
  // PUT
  // ---------------------------------------------------------------------------
  @override
  Future<dynamic> put(
    String endpoint,
    dynamic body, {
    bool isFormData = false,
  }) async {
    try {
      final headers = <String, String>{'Accept': 'application/json'};

      if (!isFormData) {
        headers['Content-Type'] = 'application/json';
      }

      print('📝 PUT => ${dio.options.baseUrl}$endpoint');
      print('📦 Body: $body');

      final response = await dio.put(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      print("❌ Response: ${e.response?.data}");
      rethrow;
    } catch (e, s) {
      print("🔥 Non-Dio Error: $e");
      print(s);
      return {'error': e.toString()};
    }
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------
  @override
  Future<dynamic> delete(String endpoint, Map<String, dynamic>? body) async {
    try {
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final response = await dio.delete(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );

      print("✅ Dio DELETE Success: ${response.statusCode}");
      print("🔵 Response: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      print("❌ Response: ${e.response?.data}");
      rethrow;
    } catch (e, s) {
      print("🔥 Non-Dio Error: $e");
      print(s);
      return {'error': e.toString()};
    }
  }

  @override
  Future<dynamic> patch(String endpoint, Map<String, dynamic>? body) async {
    try {
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      print('🛠️ PATCH => ${dio.options.baseUrl}$endpoint');
      print('📦 Body: $body');

      final response = await dio.patch(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      print("❌ Response: ${e.response?.data}");
      rethrow;
    } catch (e, s) {
      print("🔥 Non-Dio Error: $e");
      print(s);
      return {'error': e.toString()};
    }
  }
}
