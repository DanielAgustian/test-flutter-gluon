import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class GluonTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? placeholder;
  const GluonTextfield({
    super.key,
    required this.controller,
    this.onChanged,
    this.placeholder,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ColorConstant().colorWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: ColorConstant().colorQuardary),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          color: ColorConstant().colorQuardary,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
