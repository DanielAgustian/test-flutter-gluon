import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';
import 'package:test_flutter_gluon/data/sources/customer/customer_source_interface.dart';

class CustomerSource implements CustomerSourceInterface{
  @override
  List<CustomerListModel> getCustomers() {
       // TODO: implement getCustomersById
    throw UnimplementedError();
  }

  @override
  CustomerModel getCustomersById(int id) {
    // TODO: implement getCustomersById
    throw UnimplementedError();
  }

}