import 'api_status.dart';

class ApiResult<T> {

  final ApiStatus status;

  final T? data;

  final String? message;

  ApiResult({
    required this.status,
    this.data,
    this.message,
  });

  bool get isSuccess =>
      status == ApiStatus.success;
}