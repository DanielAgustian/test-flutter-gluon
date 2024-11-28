
import 'dart:convert';

class CustomerListModel  {
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

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name
    };
  }
  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
