import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class GluonButton extends StatelessWidget {
  const GluonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.colorBg,
    this.colorText,
    this.colorShadow,
    this.child,
  });
  final Function() onPressed;
  final String text;
  final Widget? child;
  final Color? colorBg;
  final Color? colorText;
  final Color? colorShadow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            backgroundColor: colorBg ?? ColorConstant().colorSecondary,
            foregroundColor: colorText ?? ColorConstant().colorPrimary,
            shadowColor: colorShadow ?? ColorConstant().colorShadow,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorText ?? ColorConstant().colorPrimary,
              fontSize: 16
            ),
          ),
          child: child ?? Text(text),
        ),
      ),
    );
  }
}
