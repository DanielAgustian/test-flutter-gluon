import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/base_model.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/screen/riverpods/dart__oop1_presenter.dart';
import 'package:test_flutter_gluon/widgets/gluon_appbar.dart';
import 'package:test_flutter_gluon/widgets/gluon_error.dart';
import 'package:test_flutter_gluon/widgets/gluon_list_child.dart';
import 'package:test_flutter_gluon/widgets/gluon_margin.dart';

class DartOOP1Screen extends ConsumerStatefulWidget {
  const DartOOP1Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DartOOP1ScreenState();
}

class _DartOOP1ScreenState extends ConsumerState<DartOOP1Screen> {
  late AsyncValue<ServiceResponse<List<ItemsModel>>> getAllItems;
  late AsyncValue<ServiceResponse<List<AllDiscountModel>>> getAllDiscount;

  @override
  Widget build(BuildContext context) {
    getAllItems = ref.watch(getAllItemsProvider);
    getAllDiscount = ref.watch(getAllDiscountProvider);
    return Scaffold(
      backgroundColor: ColorConstant().colorBg,
      appBar: GluonAppbar(
        title: TextConstant().dartOOPTest1,
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GluonMargin(type: MarginSize.large),
            const Text(APIConstant.getAllItems),
            getAllItems.when(
                data: dataList,
                error: error,
                loading: () => const CircularProgressIndicator()),
            const GluonMargin(type: MarginSize.large),
            const Text(APIConstant.getAllDiscounts),
            getAllDiscount.when(
                data: dataList,
                error: error,
                loading: () => const CircularProgressIndicator()),
            const GluonMargin(type: MarginSize.large),
          ],
        ),
      ),
    );
  }

  Widget dataList(ServiceResponse<List<dynamic>> data) {
    if (data.isFailed) {
      return GluonErrorWidget(message: data.onFailed().message);
    }
    var res = data.onSuccess();
    return Wrap(
      children: [
        ...res.map((e) => GluonListChild(
            data: jsonEncode(e.toJson()),
            title: e == null ? "" : e!.name,
            context: context))
      ],
    );
  }

  // Widget dataAllDiscount(ServiceResponse<List<dynamic>> data) {
  //   if (data.isFailed) {
  //     return GluonErrorWidget(message: data.onFailed().message);
  //   }
  //   var res = data.onSuccess();
  //   return Wrap(
  //     children: [
  //       ...res.map((e) => GluonListChild(
  //             data: e.toString(),
  //             title: e.name,
  //             context: context,
  //           ))
  //     ],
  //   );
  // }

  Widget error(Object obj, StackTrace trace) {
    return GluonErrorWidget(
      message: trace.toString(),
    );
  }
}
