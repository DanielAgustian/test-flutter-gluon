import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source.dart';

abstract class ItemsSourceInterface{

  Future<ServiceResponse<List<ItemsModel>>> getAllItems();
}
final itemSourceProvider = Provider<ItemsSourceInterface>((ref) => ItemsSource());