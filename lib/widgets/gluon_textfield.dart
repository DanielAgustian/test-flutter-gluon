import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class GluonTextfield extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? placeholder;
  final bool isPassword;
  const GluonTextfield({
    super.key,
    required this.controller,
    this.onChanged,
    this.placeholder,
    this.isPassword = false,
  });

  @override
  State<StatefulWidget> createState() => _GluonTextfieldState();
}

class _GluonTextfieldState extends State<GluonTextfield> {
  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

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
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText: obscureText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        style: TextStyle(
          color: ColorConstant().colorQuardary,
        ),
        decoration: InputDecoration(
          suffix: widget.isPassword ? _passwordWidget() : null,
          hintText: widget.placeholder,
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Widgets
  Widget _passwordWidget() {
    return InkWell(
      onTap: tapPasswordWidget,
      child: FaIcon(
          obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eyeSlash),
    );
  }

  // Function Logic
  void tapPasswordWidget() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
