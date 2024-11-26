import 'package:flutter/material.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';
import 'package:test_flutter_gluon/constant/text_constant.dart';
import 'package:test_flutter_gluon/utils/widget_utils.dart';
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
  double currColumnHeight = 1000;
  double currAvailHeight = 1001;
  double keyboardHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant().colorBg,
      body: handlerScroll(
          size: size,
          keyboardHeight: keyboardHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: currAvailHeight < currColumnHeight
                  ? MainAxisSize.min
                  : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: GluonImages.logoImage,
                    width: 200,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: GluonMargin(type: MarginSize.medium),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    TextConstant().titleWidgetTest,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorConstant().colorQuardary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                const GluonMargin(type: MarginSize.medium),
                ...formLogin(),
                const Expanded(
                  flex: 3,
                  child: GluonMargin(type: MarginSize.medium),
                ),
                InkWell(
                  onTap: onClickRegister,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      TextConstant().registerButton,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstant().colorQuardary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    ));
  }

  List<Widget> formLogin() {
    return [
      GluonTextfield(
        controller: controllerName,
        placeholder: TextConstant().placeholder1,
      ),
      const GluonMargin(type: MarginSize.medium),
      GluonTextfield(
        controller: controllerPassword,
        placeholder: TextConstant().placeholder2,
        isPassword: true,
      ),
      const GluonMargin(type: MarginSize.medium),
      GluonButton(
        onPressed: onClickLogin,
        text: TextConstant().loginButton,
      ),
    ];
  }

  Widget handlerScroll({
    required Size size,
    required double keyboardHeight,
    required Widget child,
  }) {
    return LayoutBuilder(builder: (context, constraints) {
      currColumnHeight = constraints.maxHeight;
      currAvailHeight = size.height - keyboardHeight;
      if (currAvailHeight < (currColumnHeight + 21)) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: currColumnHeight,
              ),
              child: IntrinsicHeight(child: child)),
        );
      }
      return child;
    });
  }

  void onClickLogin() {
    WidgetUtils().showFlutterToast("Click Login!");
  }

  void onClickRegister() {
    WidgetUtils().showFlutterToast("Click Register!");
  }
}
