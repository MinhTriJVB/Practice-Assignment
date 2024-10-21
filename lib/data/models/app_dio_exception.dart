import 'package:dio/dio.dart';

class AppDioException implements Exception {
  final String message;
  final int? statusCode;

  AppDioException(this.message, {this.statusCode});

  @override
  String toString() => 'DioException: $message (Status code: $statusCode)';

  static AppDioException fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return AppDioException("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return AppDioException("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return AppDioException("Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return AppDioException("Send timeout in connection with API server");
      case DioExceptionType.badResponse:
        return _handleResponseError(dioError);
      case DioExceptionType.connectionError:
        return AppDioException(
            "Connection to API server failed due to internet connection");
      case DioExceptionType.unknown:
      default:
        return AppDioException("Unexpected error occurred");
    }
  }

  static AppDioException _handleResponseError(DioException dioError) {
    final response = dioError.response;
    final statusCode = response?.statusCode ?? 0;

    if (statusCode >= 400 && statusCode < 500) {
      return AppDioException("Client error: ${response?.statusMessage}", statusCode: statusCode);
    } else if (statusCode >= 500) {
      return AppDioException("Server error: ${response?.statusMessage}", statusCode: statusCode);
    } else {
      return AppDioException("Received invalid status code: $statusCode", statusCode: statusCode);
    }
  }
}
