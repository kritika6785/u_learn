import 'package:flutter/material.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String appBarText) {
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      appBarText,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

List<String> imagePath = [
  "assets/icons/google.png",
  "assets/icons/apple.png",
  "assets/icons/facebook.png",
];

Widget buildThirdPartyLogin() {
  return GestureDetector(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30.w,
      children: List.generate(imagePath.length, (index) {
        return Container(
          height: 40.h,
          width: 40.w,
          child: Image.asset(imagePath[index]),
        );
      }),
    ),
  );
}

Widget reusableText(text) {
  return Container(
    alignment: Alignment.center,
    child:  Text(
      text,
      style: TextStyle(
        fontSize: 15.sp,
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget textFormField(
    String text,
    String hintText,
    String icon,
    void Function(String value)? func, {
      String? textType,
    })
 {
  return Container(
    margin: EdgeInsets.only(bottom: 20.0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(color:AppColors.primaryThreeElementText)),
        SizedBox(height: 5.h),
        TextField(
          onChanged: (value)=>func!(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.w),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.primarySecondaryElementText),
            prefixIcon: Container(
              height: 2.h,
              width: 2.w,
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset("assets/icons/$icon.png", scale: 1.5.w),
            ),
          ),
          style: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
            color: AppColors.primaryText,
            fontSize: 14.sp
          ),
          autocorrect: false,
          obscureText: textType == 'password' ? true : false,
        ),
      ],
    ),
  );
}

Widget forgotPassword(String data) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      child: Text(
        data,
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType, void Function() func) {
  return GestureDetector(
    onTap:func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h),
      decoration: BoxDecoration(
        color:
            buttonType == 'login'
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color:
              buttonType == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.shade100,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color:
                buttonType == 'login'
                    ? AppColors.primaryBackground
                    : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
