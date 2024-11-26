import 'package:dartz/dartz.dart';
import 'package:test_flutter_gluon/data/error/api_error.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';

ServiceResponse<List<T>> responseToListModels<T>(
  T Function(Map<String, dynamic>) method,
  List<dynamic> jsonList,
) {
  final list = <T>[];

  for (final json in jsonList) {
    try {
      final T data = method(json);
      list.add(data);
    } catch (exception) {
      print(exception);
    }
  }
  return ServiceResponse.success(list);
}

ServiceResponse<T> responseToModels<T>(
    T Function(Map<String, dynamic>) method, dynamic json) {
  try {
    T data = method(json);
    return ServiceResponse.success(data);
  } catch (e) {
    return ServiceResponse.error(ConvertError());
  }
}
