import 'package:flutter/material.dart';
import 'application_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/values/colors.dart';
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar:
            Container(
              height: 58.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 1.0,
                    blurRadius: 1
                  )
                ]
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade200))
                ),
                child: BottomNavigationBar(
                    currentIndex: _index,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    onTap: (value){
                      _index = value;
                      setState(() {

                      });
                    },
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/home.png'),
                      ),
                        label: "Home",
                        activeIcon:SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: Image.asset('assets/icons/home.png',
                            color: AppColors.primaryElement,),
                        ),
                      ),
                      BottomNavigationBarItem(icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/search2.png'),
                      ),
                        label: "Search",
                        activeIcon:SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: Image.asset('assets/icons/search2.png',
                            color: AppColors.primaryElement,),
                        ),
                      ),
                      BottomNavigationBarItem(icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/play-circle1.png'),
                      ),
                        label: "Course",

                        activeIcon:SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: Image.asset('assets/icons/play-circle1.png',
                            color: AppColors.primaryElement,),
                        ),
                      ),
                      BottomNavigationBarItem(icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/message-circle.png'),
                      ),
                        label: "Chat",
                        activeIcon:SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: Image.asset('assets/icons/message-circle.png',
                            color: AppColors.primaryElement,),
                        ),
                      ),
                      BottomNavigationBarItem(icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/person2.png'),
                      ),
                        label: "Profile",
                        activeIcon:SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child: Image.asset('assets/icons/person2.png',
                            color: AppColors.primaryElement,),
                        ),
                      ),
                    ]),
              ),
            )


      )),
    );
  }
}
