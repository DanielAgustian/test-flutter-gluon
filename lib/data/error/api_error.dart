import 'package:test_flutter_gluon/data/error/base_error.dart';

class NoDataError extends BaseError {
  NoDataError({
    super.errorCode = 404,
    super.message = "No data found",
  });
}

class ConvertError extends BaseError {
  ConvertError({
    super.errorCode = 100000,
    super.message = "Convert data wrong.",
  });
}

