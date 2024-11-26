import 'package:test_flutter_gluon/data/model/items_model.dart';

class CustomerModel {
  final int id;
  final int customerId;
  final List<ItemsModel> items;
  final DateTime date;
  final String status;

  const CustomerModel({
    required this.id,
    required this.customerId,
    required this.items,
    required this.date,
    required this.status,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    List<ItemsModel> items = [];
    if (map['items'] != null) {
      var listItems = List.from(map['items']).toList();
      items = listItems.map((e) => ItemsModel.fromJson(e)).toList();
    }
    return CustomerModel(
      id: map["id"] as int,
      customerId: map["customerId"] as int,
      items: items,
      date: map["date"] == null ? DateTime(0) : DateTime.parse(map["date"]),
      status: map['status'],
    );
  }
}
