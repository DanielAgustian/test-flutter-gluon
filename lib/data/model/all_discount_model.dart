import 'dart:convert';

import 'package:test_flutter_gluon/data/model/discount_items_model.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';

class AllDiscountModel extends DiscountItemsModel {
  int id;
  String name;

  String category;
  String? loyaltyDiscountCriteria;
  String? loyaltyDiscountCriteriaValue;

  AllDiscountModel({
    required this.id,
    required this.name,
    required super.type,
    required super.value,
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
  @override
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

  double? getNumLoyaltyLimit() {
    if (loyaltyDiscountCriteriaValue != null) {
      return double.parse(loyaltyDiscountCriteriaValue!);
    }
    return null;
  }

  @override
  double calculateDiscount(double price, {int itemsTotal = 0}) {
    switch (category) {
      case "productCategory":
        return super.calculateDiscount(price);
      case "loyalty":
        print("------ Loyalty -------------" + name);
        if (getNumLoyaltyLimit() == null) {
          return price;
        }
        switch (loyaltyDiscountCriteria) {
          case "orderTotal":
            if (price >= getNumLoyaltyLimit()!) {
              return super.calculateDiscount(price);
            } else {
              return price;
            }
          case "orderCount":
            print("ITEMS TOTAL" + itemsTotal.toString());
            print(getNumLoyaltyLimit());
            if (itemsTotal >= getNumLoyaltyLimit()!) {
              return super.calculateDiscount(price);
            } else {
              return price;
            }
          default:
            return price;
        }
      default:
        return price;
    }
  }
}
