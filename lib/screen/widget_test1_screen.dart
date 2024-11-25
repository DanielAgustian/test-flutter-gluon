import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class WidgetTest1Screen extends StatefulWidget {
  const WidgetTest1Screen({super.key});

  @override
  State<WidgetTest1Screen> createState() => _WidgetTest1ScreenState();
}

class _WidgetTest1ScreenState extends State<WidgetTest1Screen> {
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
            
          ],
        ),
      ),
    );
  }
}
