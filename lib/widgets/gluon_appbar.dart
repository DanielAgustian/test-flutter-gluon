import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class GluonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GluonAppbar({
    super.key,
    required this.title,
    this.isCenterTitle,
    this.hasBackButton = false,
  });
  final String title;
  final bool? isCenterTitle;
  final bool hasBackButton;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton
          ? InkWell(
              onTap: () {},
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: ColorConstant().colorPrimary,
                ),
              ),
            )
          : null,
      backgroundColor: ColorConstant().colorSecondary,
      title: Text(
        title,
        style: TextStyle(color: ColorConstant().colorPrimary, fontWeight: FontWeight.bold),
      ),
      centerTitle: isCenterTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
