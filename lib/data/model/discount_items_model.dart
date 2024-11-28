class DiscountItemsModel {
  String type;
  String value;

  DiscountItemsModel({required this.type, required this.value});

  factory DiscountItemsModel.fromJson(Map<String, dynamic> map) {
    return DiscountItemsModel(
        type: map["type"] ?? "", value: map["value"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  double getValue() {
    return double.parse(value);
  }

  double calculateDiscount(double price) {
    switch (type) {
      case "percentage":
        return price * (100 - getValue()) * 0.01;
      case "fixed":
        return price - getValue();
      default:
        return price;
    }
  }
}
