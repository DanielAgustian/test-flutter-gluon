import 'dart:convert';

import 'package:test_flutter_gluon/data/model/base_model.dart';

class AllDiscountModel implements BaseClass {
  int id;
  String name;
  String type;
  String value;
  String category;
  String? loyaltyDiscountCriteria;
  String? loyaltyDiscountCriteriaValue;

  AllDiscountModel({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
    required this.category,
    this.loyaltyDiscountCriteria,
    this.loyaltyDiscountCriteriaValue,
  });

  factory AllDiscountModel.fromJson(Map<String, dynamic> map) {
    return AllDiscountModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      value: map['value'],
      category: map['category'],
      loyaltyDiscountCriteria: map['loyaltyDiscountCriteria'],
      loyaltyDiscountCriteriaValue: map['loyaltyDiscountCriteriaValue'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "value": value,
      "category": category,
      "loyaltyDiscountCriteria": loyaltyDiscountCriteria,
      "loyaltyDiscountCriteriaValue": loyaltyDiscountCriteriaValue,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
