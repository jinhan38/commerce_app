import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

var nFormat = NumberFormat('###,###,###,###');

void showToast(String msg) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
}
