import 'dart:convert';

import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/data/error/api_error.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/discount/discount_source_interface.dart';
import 'package:test_flutter_gluon/utils/logic_utils.dart';
import 'package:test_flutter_gluon/utils/mock_utils.dart';

class DiscountSource extends DiscountSourceInterface{
  @override
  Future<ServiceResponse<List<AllDiscountModel>>> getAllDiscount() async {
    var result = await MockUtils().mockAPICall(APIConstant.getAllDiscounts);
    if (result == null) {
      return ServiceResponse.error(NoDataError());
    }
    var json = jsonDecode(result);
    if (json == null) {
      return ServiceResponse.error(NoDataError());
    }
    return responseToListModels(AllDiscountModel.fromJson, json['data']);
  }

}