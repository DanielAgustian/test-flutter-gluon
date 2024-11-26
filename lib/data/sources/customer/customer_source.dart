import 'dart:convert';

import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/data/error/api_error.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/customer/customer_source_interface.dart';
import 'package:test_flutter_gluon/utils/logic_utils.dart';
import 'package:test_flutter_gluon/utils/mock_utils.dart';

class CustomerSource implements CustomerSourceInterface {
  @override
  Future<ServiceResponse<List<CustomerListModel>>> getCustomers() async {
    var result = await MockUtils().mockAPICall(APIConstant.getAllCustomers);
    if (result == null) {
      return ServiceResponse.error(NoDataError());
    }
    var json = jsonDecode(result);
    if (json == null) {
      return ServiceResponse.error(NoDataError());
    }
    return responseToListModels(CustomerListModel.fromJson, json['data']);
  }

  @override
  Future<ServiceResponse<CustomerModel>> getCustomersById(int id) async {
    var result =
        await MockUtils().mockAPICall(APIConstant.getOrdersbyCustomer(id));
    if (result == null) {
      return ServiceResponse.error(NoDataError());
    }
    var json = jsonDecode(result);
    if (json == null) {
      return ServiceResponse.error(NoDataError());
    }
    return responseToModels(CustomerModel.fromJson, json['data']);
  }
}
 