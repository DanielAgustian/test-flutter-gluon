import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/customer/customer_source.dart';

abstract class CustomerSourceInterface {
  Future<ServiceResponse<List<CustomerListModel>>> getCustomers();
  Future<ServiceResponse<CustomerModel>> getCustomersById(int id);
}

final customerSourceProvider =
    Provider<CustomerSourceInterface>((ref) => CustomerSource());
