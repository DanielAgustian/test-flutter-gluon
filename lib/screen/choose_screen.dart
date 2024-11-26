import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/route_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/widgets/gluon_appbar.dart';
import 'package:test_flutter_gluon/widgets/gluon_button.dart';
import 'package:test_flutter_gluon/widgets/gluon_margin.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});
  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstant().colorBg,
      appBar: GluonAppbar(title: TextConstant().chooseTitle),
      body: SizedBox(
        height: size.height - 55,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GluonMargin(
                type: MarginSize.large,
              ),
              GluonButton(
                onPressed: () {
                  gotoWidgetTest1();
                },
                text: TextConstant().widgetTest1,
              ),
              const GluonMargin(
                type: MarginSize.medium,
              ),
              GluonButton(
                onPressed: () {
                  gotoDartOOPTest1();
                },
                text: TextConstant().dartOOPTest1,
              ),
              const GluonMargin(
                type: MarginSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void gotoWidgetTest1() {
    context.push(RouteConstant().widgetTest1);
  }

  void gotoDartOOPTest1() {
    context.push(RouteConstant().dartOOPTest1);
  }
}
