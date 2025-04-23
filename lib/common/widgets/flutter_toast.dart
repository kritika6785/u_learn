import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

toastInfo({
  required String msg,
  Color backgoundColor = Colors.white,
  Color textColor =Colors.black ,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: backgoundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}
