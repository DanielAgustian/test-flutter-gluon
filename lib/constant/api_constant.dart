class APIConstant{
  //Hostname is empty because I use json to mock API Call.
  static const String hostname= ''; 
  static const String getAllItems = '$hostname/v1/items';
  static const String getAllDiscounts = '$hostname/v1/discounts';
  static const String getAllCustomers = '$hostname/v1/customers';
  static String getOrdersbyCustomer(int customerId) => '$hostname/v1/orders/$customerId';
}