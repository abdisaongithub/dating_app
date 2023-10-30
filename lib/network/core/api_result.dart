import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exceptions.dart';

part 'api_result.freezed.dart';

/// Not to be confused with ApiResponse, which is a
/// direct JSON representation of the API call. ApiResult is a wrapper
/// to denote success or failure to be consumed by the next layer
@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required NetworkExceptions error}) =
      Failure<T>;
}
