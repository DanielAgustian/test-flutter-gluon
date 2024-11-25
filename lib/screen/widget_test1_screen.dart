import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/widgets/gluon_button.dart';
import 'package:test_flutter_gluon/widgets/gluon_images.dart';
import 'package:test_flutter_gluon/widgets/gluon_margin.dart';
import 'package:test_flutter_gluon/widgets/gluon_textfield.dart';

class WidgetTest1Screen extends StatefulWidget {
  const WidgetTest1Screen({super.key});

  @override
  State<WidgetTest1Screen> createState() => _WidgetTest1ScreenState();
}

class _WidgetTest1ScreenState extends State<WidgetTest1Screen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant().colorBg,
      body: Container(
        height: size.height - keyboardHeight,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image(
              image: GluonImages.logoImage,
              width: 200,
            ),
            Expanded(
              child: SizedBox(),
              flex: 2,
            ),
            
            GluonTextfield(
              controller: controllerName,
              placeholder: TextConstant().placeholder1,
            ),
            const GluonMargin(type: MarginSize.medium),
            GluonTextfield(
              controller: controllerName,
              placeholder: TextConstant().placeholder2,
            ),
            const GluonMargin(type: MarginSize.medium),
            GluonButton(onPressed: () {}, text: TextConstant().loginButton),
            Expanded(
              child: SizedBox(),
              flex: 6,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
