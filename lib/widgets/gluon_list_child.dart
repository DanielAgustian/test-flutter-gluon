import 'package:flutter/material.dart';

class GluonListChild extends StatelessWidget {
  final String data;
  final String title;
  final BuildContext context;
  const GluonListChild(
      {super.key,
      required this.data,
      required this.title,
      required this.context});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (size.width / 2) - 12,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void onPressed() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(data),
            ));
  }
}
