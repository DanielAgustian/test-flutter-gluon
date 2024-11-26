import 'package:test_flutter_gluon/data/model/base_model.dart';

class CustomerListModel implements BaseClass {
  int id;
  String name;

  CustomerListModel({
    required this.id,
    required this.name,
  });

  
  factory CustomerListModel.fromJson(Map<String, dynamic> map) {
    return CustomerListModel(
      id: map["id"],
      name: map["name"],
    );
  }


}
