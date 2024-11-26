class AllDiscountModel {
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
}
