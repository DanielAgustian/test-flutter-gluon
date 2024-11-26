import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/customer/customer_source.dart';
import 'package:test_flutter_gluon/data/sources/discount/discount_source.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source_interface.dart';

final getAllItemsProvider =
    FutureProvider<ServiceResponse<List<ItemsModel>>>((ref) async {
  return ref.watch(itemSourceProvider).getAllItems();
});
