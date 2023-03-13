import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_cloud_music_lite/network/RequestConfig.dart';
import 'package:flutter_cloud_music_lite/network/api_exception.dart';
import 'package:flutter_cloud_music_lite/network/token_interceptor.dart';
import 'package:flutter_cloud_music_lite/widgets/status/app_loading_widget.dart';
import 'package:get/state_manager.dart';

import '../models/music/music_search_result_model.dart';

class RequestClient {
  static RequestClient? _client;
  static RequestClient get instance{
    _client ??= RequestClient();
    return _client!;
  }
  late Dio _dio;

  RequestClient() {
    _dio = Dio(BaseOptions(
        baseUrl: RequestConfig.baseUrl,
        connectTimeout:
            const Duration(milliseconds: RequestConfig.connectTimeout)))
      ..interceptors.add(TokenInterceptor());
  }

  Future<dynamic> request(
    String url, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool Function(ApiException)? onError,
    bool isShowLoading = true,
  }) async {
    try {
      return await loading(() async {
        Options options = Options()
          ..method = method
          ..headers = headers;
        var response = await _dio.request(url,
            queryParameters: queryParameters, data: data, options: options);

        return _handleResponse(response);
      }, isShowLoading: isShowLoading);
    } catch (e, s) {
      print(s);
      var exception = ApiException.from(e);
      if (onError?.call(exception) != true &&
          _handleException(exception) != true) {
        throw exception;
      }
    }
    return null;
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == RequestConfig.successCode) {
      return response.data;
    } else {
      if (response.statusCode == HttpStatus.unauthorized) {
        //need oauth
      }
      var exception = ApiException(response.statusCode, response.statusMessage);
      throw exception;
    }
  }

  bool _handleException(ApiException exception) {
    if (exception.code == HttpStatus.unauthorized) {
      //todo to login
      return true;
    }
    return false;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        queryParameters: queryParameters,
        headers: headers,
        isShowLoading: showLoading,
        onError: onError);
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: 'POST',
        queryParameters: queryParameters,
        headers: headers,
        data: data,
        isShowLoading: showLoading,
        onError: onError);
  }
}
