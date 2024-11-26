import 'dart:convert';

import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source_interface.dart';
import 'package:test_flutter_gluon/utils/mock_utils.dart';

class ItemsSource implements ItemsSourceInterface {
  @override
  Future<List<ItemsModel>> getAllItems() async {
   var result = await MockUtils().mockAPICall(APIConstant.getAllItems);
   if (result == null) {
     return [];
   }
   var json = jsonDecode(result);
   if (json == null) {
     return [];
   }
   return [];
  //  List<ItemsModel> models = 
  }
}
