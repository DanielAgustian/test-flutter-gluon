import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class GluonErrorWidget extends StatelessWidget {
  final String message;

  const GluonErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      color: ColorConstant().colorError,
      width: size.width,
      height: 200,
      child: Center(
        child: Text(
          "Error $message",
          style: TextStyle(color: ColorConstant().colorWhite),
        ),
      ),
    );
  }
}


