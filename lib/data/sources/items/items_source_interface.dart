import 'package:dartz/dartz.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';

abstract class ItemsSourceInterface{

  Future<List<ItemsModel>> getAllItems();
}