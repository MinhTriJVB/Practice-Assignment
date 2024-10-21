import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:practice/data/models/app_dio_exception.dart';
import 'package:practice/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum Method { get, post, put, patch, delete }

class BaseService {
  late Dio dio;

  BaseService() {
    final headers = <String, dynamic>{
      'Content-type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
    };

    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseURL,
        headers: headers,
      ),
    );
  }

  Future<Either<AppDioException, dynamic>> requestApi({
    required final Method method,
    required final String path,
    final Map<String, dynamic>? params,
    final body,
    final void Function(int, int)? onSendProgress,
    final Options? options,
  }) async {
    Response response;
    try {
      response = await _request(
        method: method,
        path: path,
        params: params,
        body: body,
        options: options,
        onSendProgress: onSendProgress,
      );
      return right(response.data);
    } on DioException catch (error, stackTrace) {
      return left(AppDioException.fromDioError(error));
    }
  }

  Future<Response> _request({
    required final Method method,
    required final String path,
    final Map<String, dynamic>? params,
    final body,
    final void Function(int, int)? onSendProgress,
    final Options? options,
  }) {
    switch (method) {
      case Method.get:
        return dio.get(
          path,
          queryParameters: params,
          options: options,
        );
      case Method.post:
        return dio.post(
          path,
          data: body,
          queryParameters: params,
          onSendProgress: onSendProgress,
          options: options,
        );
      case Method.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: params,
          options: options,
        );
      case Method.put:
        return dio.put(
          path,
          data: body,
          queryParameters: params,
          options: options,
        );
      case Method.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: params,
          options: options,
        );
    }
  }
}
