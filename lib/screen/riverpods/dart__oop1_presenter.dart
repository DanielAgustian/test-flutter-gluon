import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/customer/customer_source_interface.dart';
import 'package:test_flutter_gluon/data/sources/discount/discount_source_interface.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source_interface.dart';

final getAllItemsProvider =
    FutureProvider<ServiceResponse<List<ItemsModel>>>((ref) async {
  return ref.watch(itemSourceProvider).getAllItems();
});

final getAllDiscountProvider =
    FutureProvider<ServiceResponse<List<AllDiscountModel>>>((ref) {
  return ref.watch(discountProvider).getAllDiscount();
});

final getAllCustomersProvider =
    FutureProvider<ServiceResponse<List<CustomerListModel>>>((ref) {
  return ref.watch(customerSourceProvider).getCustomers();
});

final getOrderByCustomerProvider =
    FutureProvider.family<ServiceResponse<CustomerModel>, int>(
        (ref, id) => ref.watch(customerSourceProvider).getCustomersById(id));
