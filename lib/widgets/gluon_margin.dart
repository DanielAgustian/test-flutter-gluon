import 'package:flutter/material.dart';

enum MarginSize {
  small,
  medium,
  large,
  extraLarge,
}

class GluonMargin extends StatelessWidget {
  final MarginSize type;

  const GluonMargin({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _marginSize(),
      width: _marginSize(),
    );
  }

  double _marginSize() {
    switch (type) {
      case MarginSize.small:
        return 8;
      case MarginSize.medium:
        return 16;
      case MarginSize.large:
        return 24;
      case MarginSize.extraLarge:
        return 32;
      default:
        return 0;
    }
  }
}
