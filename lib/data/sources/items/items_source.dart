import 'dart:convert';

import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/data/error/api_error.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source_interface.dart';
import 'package:test_flutter_gluon/utils/logic_utils.dart';
import 'package:test_flutter_gluon/utils/mock_utils.dart';

class ItemsSource implements ItemsSourceInterface {
  @override
  Future<ServiceResponse<List<ItemsModel>>> getAllItems() async {
    var result = await MockUtils().mockAPICall(APIConstant.getAllItems);
    if (result == null) {
      return ServiceResponse.error(NoDataError());
    }
    var json = jsonDecode(result);
    if (json == null) {
      return ServiceResponse.error(NoDataError());
    }
    return responseToListModels(ItemsModel.fromJson, json['data']);
  }
}

