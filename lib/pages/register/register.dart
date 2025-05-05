import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child:Column(
                  children: [
                    SizedBox(height: 20.sp,),
                    buildThirdPartyLogin(),
                    SizedBox(height: 10.sp,),
                    reusableText("or use your email account login"),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        children: [
                          textFormField('Email', 'Enter your email address', 'user',(value){
                      //      context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          textFormField('Password', 'Enter your password', 'lock', (value){
                        //    context.read<SignInBloc>().add(PasswordEvent(value));
                          }, textType: 'password'),
                        ],
                      ),
                    ),
                    forgotPassword('Forgot password?'),
                    buildLoginAndRegButton('Log In', 'login',(){
                      print('object');
                      //SignInController(context: context).handleSignIn('email');
                    }),
                    buildLoginAndRegButton('Sign Up', 'register',() {
                      Navigator.of(context).pushNamed("register");  }),

                  ],
                ) ,
              )
          )
      ),
    );
  }
}
