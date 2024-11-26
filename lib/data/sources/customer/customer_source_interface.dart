import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';

abstract class CustomerSourceInterface {
  List<CustomerListModel> getCustomers();
  CustomerModel getCustomersById(int id);
}