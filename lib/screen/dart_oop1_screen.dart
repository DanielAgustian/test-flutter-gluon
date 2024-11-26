import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_gluon/constant/api_constant.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/data/model/items_model.dart';
import 'package:test_flutter_gluon/data/model/service_response.dart';
import 'package:test_flutter_gluon/screen/riverpods/dart__oop1_vm.dart';
import 'package:test_flutter_gluon/widgets/gluon_appbar.dart';
import 'package:test_flutter_gluon/widgets/gluon_error.dart';
import 'package:test_flutter_gluon/widgets/gluon_list_child.dart';

class DartOOP1Screen extends ConsumerStatefulWidget {
  const DartOOP1Screen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DartOOP1ScreenState();
}

class _DartOOP1ScreenState extends ConsumerState<DartOOP1Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(getAllItemsProvider);
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
            const Text(APIConstant.getAllItems),
            userData.when(
                data: dataAllItems,
                error: error,
                loading: () => const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }

  Widget dataAllItems(ServiceResponse<List<ItemsModel>> data) {
    if (data.isFailed) {
      return GluonErrorWidget(message: data.onFailed().message);
    }
    var res = data.onSuccess();
    return Wrap(
      children: [
        ...res.map((e) => GluonListChild(
            data: jsonEncode(e.toJson()), title: e.name, context: context))
      ],
    );
  }

  Widget error(Object obj, StackTrace trace) {
    return GluonErrorWidget(
      message: trace.toString(),
    );
  }
}
