import 'package:test_flutter_gluon/data/sources/customer/customer_source_interface.dart';
import 'package:test_flutter_gluon/data/sources/discount/discount_source_interface.dart';
import 'package:test_flutter_gluon/data/sources/items/items_source_interface.dart';

class Repo{
  final CustomerSourceInterface customerSource;
  final DiscountSourceInterface discountSource;
  final ItemsSourceInterface itemsSourceInterface;

  Repo({required this.customerSource, required this.discountSource, required this.itemsSourceInterface});

  
  
}