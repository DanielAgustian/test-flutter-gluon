import 'package:test_flutter_gluon/data/error/base_error.dart';

typedef ServiceResponse<SuccessType>
    = RawServiceResponse<SuccessType, BaseError>;

class RawServiceResponse<SuccessType, FailedType> {
  final SuccessType? _data;
  
  final FailedType? _error;

  bool get isFailed => _error != null;

  bool get isSuccess => _data != null;

  RawServiceResponse._({FailedType? error, SuccessType? data})
      : _error = error,
        _data = data,
        assert(
            (error == null && data != null) || (error != null && data == null),
            "Error and Data cannot be both filled at the same time");

  factory RawServiceResponse.error(FailedType error) =>
      RawServiceResponse._(error: error);

  factory RawServiceResponse.success(SuccessType data) =>
      RawServiceResponse._(data: data);

  FailedType onFailed() {
    return _error!;
  }

  SuccessType onSuccess() {
    return _data!;
  }
}
