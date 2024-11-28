import 'dart:convert';
import 'package:test_flutter_gluon/data/enum/category_enum.dart';
import 'package:test_flutter_gluon/data/model/discount_items_model.dart';

class ItemsModel {
  int id;
  String name;
  CategoryEnum category;
  DateTime? expiredTime;
  String? storageRequirements;
  String unit;
  String? packaging;
  String? animalSpecific;
  int? warrantyLengthInMonths;
  String? material;
  String price;
  List<DiscountItemsModel> discounts;

  ItemsModel({
    required this.id,
    required this.name,
    required this.category,
    this.expiredTime,
    this.storageRequirements,
    required this.unit,
    this.packaging,
    this.animalSpecific,
    this.warrantyLengthInMonths,
    this.material,
    required this.price,
    required this.discounts,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> map) {
    List<DiscountItemsModel> mapDiscount = [];
    if (map['discounts'] != null) {
      var listDiscount = List.from(map['discounts']).toList();
      mapDiscount =
          listDiscount.map((e) => DiscountItemsModel.fromJson(e)).toList();
    }

    return ItemsModel(
      category: CategoryEnum.values.byName(map["category"]),
      unit: map["unit"],
      price: map["price"],
      discounts: mapDiscount,
      id: map["id"],
      name: map["name"],
      expiredTime: map["expiredTime"] == null
          ? null
          : DateTime.parse(map["expiredTime"]),
      packaging: map['packaging'],
      animalSpecific: map["animalSpecific"],
      warrantyLengthInMonths: map['warrantyLengthInMonths'] == null ||
              map['warrantyLengthInMonths'] == ''
          ? null
          : int.parse(map['warrantyLengthInMonths']),
      material: map['material'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category.name,
      'expiredTime': expiredTime?.toIso8601String(),
      'storageRequirements': storageRequirements,
      'unit': unit,
      'packaging': packaging,
      'animalSpecific': animalSpecific,
      'warrantyLengthInMonths': warrantyLengthInMonths,
      'material': material,
      'price': price,
      'discounts': discounts.map((discount) => discount.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  double getTruePrice() {
    double percentage = 0, fixed = 0;
    double currPrice = double.parse(price);
    for (var discount in discounts) {
      if (discount.type == 'percentage') {
        percentage += double.parse(discount.value);
      } else {
        fixed += double.parse(discount.value);
      }
    }
    double decPercent = (100 - percentage) / 100;
    var result = (currPrice * decPercent) - fixed;
    if (result < 0) {
      result = 0;
    }
    return result;
  }
}

