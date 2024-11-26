import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/data/sources/discount/discount_source.dart';

abstract class DiscountSourceInterface{
  Future<ServiceResponse<List<AllDiscountModel>>> getAllDiscount();
}

final discountProvider = Provider<DiscountSourceInterface>((ref) => DiscountSource()) ;