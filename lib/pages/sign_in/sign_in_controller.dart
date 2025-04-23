import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_blocs.dart';
class SignInController {
  // since we are using bloc we need our own context
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async{
    try{
      if(type == 'email'){
        // BlocProvider.of<SignInBLoc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){

        }
        if(password.isEmpty){

        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress, password: password);
          if(credential.user == null){

          }
          if(!credential.user!.emailVerified){

          }
          var user = credential.user;
          if(user != null){

          }else {

          }
        }catch(e){}
      }
    }
    catch(r){}
  }
}
