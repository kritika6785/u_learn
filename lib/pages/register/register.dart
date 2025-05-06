import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state){
      return   Container(
        color: Colors.white,
        child:  SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Sign Up"),
                body: SingleChildScrollView(
                  child:Column(
                    children: [
                      SizedBox(height: 10.sp,),
                      reusableText("Enter your details below and free sign up "),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          children: [
                            textFormField('User name', 'Enter your user name', 'user',(value){
                              context.read<RegisterBloc>().add(UserNameEvent(value));
                            }),
                            textFormField('Email', 'Enter your email address', 'user',(value){
                              context.read<RegisterBloc>().add(EmailEvent(value));
                            }),
                            textFormField('Password', 'Enter your password', 'lock', (value){
                              context.read<RegisterBloc>().add(PasswordEvent(value));
                            }, textType: 'password'),
                            textFormField('Confirm Password', 'Re- enter your password', 'lock', (value){
                              context.read<RegisterBloc>().add(RePasswordEvent(value));
                            }, textType: 'password'),
                            reusableText("By creating an account you have to agree with our terms and conditions"),

                          ],
                        ),
                      ),

                      buildLoginAndRegButton('Sign Up', 'register',() {
                        Navigator.of(context).pushNamed("register");  }),

                    ],
                  ) ,
                )
            )
        ),
      );
    });

  }
}
