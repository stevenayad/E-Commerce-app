import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/cache_helper.dart';


class InterceptorsConsumer extends Interceptor {
  final Dio dio;

  InterceptorsConsumer({required this.dio});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper.getAccessToken();
    print("🧩 Access Token from Cache: $token");
    final userId = CacheHelper.getUserId();
    print("🧩 ID from Cache: $userId");

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      print("✅ Token Attached");
    } else {
      print("❌ Token Missing");
    }


    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }


  
}
