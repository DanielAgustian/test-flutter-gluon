import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
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
      appBar: AppBar(
        backgroundColor: ColorConstant().colorSecondary,
        title: Text(
          TextConstant().chooseTitle,
          style: TextStyle(color: ColorConstant().colorPrimary),
        ),
        centerTitle: true,
      ),
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

  void gotoWidgetTest1() {}
  void gotoDartOOPTest1() {}
}
