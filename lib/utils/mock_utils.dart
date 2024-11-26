import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_flutter_gluon/constant/api_constant.dart';

class MockUtils {
  Future<String?> mockAPICall(String files) async {
    var filesName = _getFilesFromAPILink(files);
    if (filesName == null) {
      return null;
    }
    try {
      final String response =
          await rootBundle.loadString('assets/json/$files.json');
      return response;
    } catch (e) {
      return null;
    }
  }

  String? _getFilesFromAPILink(String files) {
    Map<String, String> mappingFiles = {
      APIConstant.getAllCustomers: 'all-customer',
      APIConstant.getAllDiscounts: 'all-discount',
      APIConstant.getAllItems: 'all-items',
    };
    var pathFiles = mappingFiles[files];
    if (pathFiles != null) {
      return pathFiles!;
    }
    if (files.contains('/v1/orders/')) {
      return 'order-by-customer';
    }
    return null;
  }
}
