import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';

class CustomerModel extends CustomerListModel {
  final int orderId;
  final int customerId;
  final List<ItemsModel> items;
  final DateTime date;
  final String status;

  CustomerModel({
    required this.orderId,
    required this.customerId,
    required this.items,
    required this.date,
    required this.status,
    required super.name,
  }) : super(id: customerId);

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    List<ItemsModel> items = [];
    if (map['items'] != null) {
      var listItems = List.from(map['items']).toList();
      items = listItems.map((e) => ItemsModel.fromJson(e)).toList();
    }
    return CustomerModel(
      orderId: map["id"] as int,
      customerId: map["customerId"] as int,
      items: items,
      date: map["date"] == null ? DateTime(0) : DateTime.parse(map["date"]),
      status: map['status'],
      name: map['name'] ?? "",
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': orderId,
      'customerId': customerId,
      'items': items.map((item) => item.toJson()).toList(),
      'date': date.toIso8601String(),
      'status': status,
      'name': name,
    };
  }

  double totalPrice() {
    double total = 0;
    for (ItemsModel item in items) {
      total = total += item.getTruePrice();
    }
    return total;
  }

  int itemsCount(){
    return items.length;
  }
}
