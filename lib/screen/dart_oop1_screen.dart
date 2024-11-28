import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/other_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/data/model/all_discount_model.dart';
import 'package:test_flutter_gluon/data/model/customer_list_model.dart';
import 'package:test_flutter_gluon/data/model/customer_model.dart';
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
  late AsyncValue<ServiceResponse<List<CustomerListModel>>> getAllCustomers;
  late AsyncValue<ServiceResponse<CustomerModel>> getOrdersbyCustomer;
  int id = 1; //for simple example
  @override
  Widget build(BuildContext context) {
    getAllItems = ref.watch(getAllItemsProvider);
    getAllDiscount = ref.watch(getAllDiscountProvider);
    getAllCustomers = ref.watch(getAllCustomersProvider);
    getOrdersbyCustomer = ref.watch(getOrderByCustomerProvider(id));
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
            const Text(APIConstant.getAllCustomers),
            getAllCustomers.when(
                data: dataList,
                error: error,
                loading: () => const CircularProgressIndicator()),
            const GluonMargin(type: MarginSize.large),
            Text(APIConstant.getOrdersbyCustomer(id)),
            getOrdersbyCustomer.when(
                data: printDataOrders,
                error: error,
                loading: () => const CircularProgressIndicator()),
            const GluonMargin(type: MarginSize.large),
          ],
        ),
      ),
    );
  }

  Widget printDataOrders(ServiceResponse<CustomerModel> data) {
    if (data.isFailed) {
      return GluonErrorWidget(message: data.onFailed().message);
    }
    final refDiscountData = ref.read(getAllDiscountProvider);
    var discountData = refDiscountData.asData;
    if (discountData == null) {
      return const GluonErrorWidget(message: "Cannot calculate discount");
    }
    ServiceResponse<List<AllDiscountModel>> listDiscount = discountData.value;
    var res = data.onSuccess();
    double totalItemsPrice =  logicToCalculateResult(res, listDiscount);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("OrderID: ${res.orderId}"),
        Text("CustomerID ${res.customerId}"),
        Text("Total $totalItemsPrice"),
        Wrap(
          children: [
            ...res.items.map((e) => GluonListChild(
                data: jsonEncode(e.toJson()), title: e.name, context: context))
          ],
        )
      ],
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

  Widget error(Object obj, StackTrace trace) {
    return GluonErrorWidget(
      message: trace.toString(),
    );
  }

  double logicToCalculateResult(CustomerModel res,
      ServiceResponse<List<AllDiscountModel>> listDiscount) {
    var resDiscount = listDiscount.onSuccess();
    var totalItemsPrice = res.totalPrice();

    for (var discount in resDiscount) {
      totalItemsPrice = discount.calculateDiscount(totalItemsPrice,
          itemsTotal: res.items.length);
    }
    totalItemsPrice = (100 + OtherConstant().vat) * totalItemsPrice * 0.01;
    return totalItemsPrice;
  }
}
