import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/route_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/widgets/gluon_appbar.dart';
import 'package:test_flutter_gluon/widgets/gluon_button.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});
  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant().colorBg,
      appBar: GluonAppbar(title: TextConstant().chooseTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GluonButton(
              onPressed: () {
                gotoWidgetTest1();
              },
              text: TextConstant().widgetTest1,
            ),
            
            GluonButton(
              onPressed: () {
                gotoDartOOPTest1();
              },
              text: TextConstant().dartOOPTest1,
            )
          ],
        ),
      ),
    );
  }

  void gotoWidgetTest1() {
    context.go(RouteConstant().widgetTest1);
  }

  void gotoDartOOPTest1() {}
}
