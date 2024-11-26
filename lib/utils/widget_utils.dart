import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter_gluon/constant/color_constant.dart';

class WidgetUtils {
  void showFlutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant().colorQuardary,
        textColor: ColorConstant().colorBg,
        fontSize: 16.0);
  }
}
