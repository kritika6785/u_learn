import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_bloc.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_states.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_events.dart';
import 'package:u_learn/main.dart';
import 'package:u_learn/common/values/colors.dart';



class Welcome extends StatefulWidget {
   Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state){
        return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 34.h),
        width: 345.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index){
                state.page = index;
                BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
              },
              children: [
                _Page(
                    1,
                    context,
                    "First See Learning",
                    "Forgot about a for of paper all knowledge in one learning",
                    "assets/images/reading.png",
                    "Next"),
                _Page(
                    2,
                    context,
                    "Connect with Everyone",
                    "Always keep in touch with your tutor & friend. Let's get connected",
                    "assets/images/boy.png",
                    "Next"),
                _Page(
                    3,
                    context,
                    "Always Fascinated Learning",
                    "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                    "assets/images/man.png",
                    "Get Started"),
              ],
            ),
            Positioned(
                bottom: 50.h,
                child: DotsIndicator(
                  position: state.page!.toDouble(),
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      color: AppColors.primaryFourElementText,
                      size: const Size.square(8.0),
                      activeSize: Size(18, 8),
                      activeColor: AppColors.primaryElement,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ))
          ],
        ),
      ));},
        );
  }
  Widget _Page (int index,
      BuildContext context,
      String title,
      String subtitle,
      String imagePath,
      String buttonText){
     return  Column(
       children: [
         SizedBox(
           width: 345.w,
           height: 345.w,
           child: Image.asset(imagePath,
           fit: BoxFit.contain,),
         ),
         Container(
           child: Text(title,
             style: TextStyle(color: AppColors.primaryText,
                 fontSize: 24.sp,
                 fontWeight: FontWeight.normal),),
         ),
         SizedBox(
           height: 10.h,
         ),
         Container(
           width: 375.w,
           padding: EdgeInsets.only(left: 30.w,right: 30.w),
           // "Forgot about a for of paper all knowledge in one learning"
           child:Text(subtitle,
             style: TextStyle(color: AppColors.primarySecondaryElementText,
                 fontSize: 14.sp,
                 fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
         ),
         GestureDetector(
           onTap: (){
             // within 0-2 
             if(index<3){
               pageController.animateToPage(index,
                   duration: Duration(milliseconds: 500),
                   curve: Curves.easeInCirc);
             }
             else {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
               Navigator.pushNamedAndRemoveUntil(context, "/sign-in", (route)=>false);
             }
           },
           child:  Container(
               width: 325.w,
               height: 50.h,
               margin: EdgeInsets.only(top:50.w,left: 25.w,right: 25.w),
               decoration: BoxDecoration(
                   color: AppColors.primaryElement,
                   borderRadius: BorderRadius.circular(15.w),
                   boxShadow: [
                     BoxShadow(
                         color: AppColors.primaryFourElementText,
                         spreadRadius: 1,
                         blurRadius: 2,
                         offset: Offset(0,1)
                     )
                   ]
               ),
               child:Center(child:
               Text(buttonText,
                 style: TextStyle(color: AppColors.primaryBackground,
                     fontSize: 16.sp,
                     fontWeight: FontWeight.normal),textAlign: TextAlign.center,),)

           ),
         )
        


       ],
     );
  }
}
