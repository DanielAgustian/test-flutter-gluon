import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';

abstract class DiscountSourceInterface{
  Future<ServiceResponse<List<AllDiscountModel>>> getAllDiscount();
}