import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:u_learn/common/widgets/flutter_toast.dart';

import '../application/application_page.dart';
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
          toastInfo(msg:"emailAddress is empty.");
        }
        if(password.isEmpty){
          toastInfo(msg:"password is empty.");
        }
        try {
          print("email is $emailAddress");
          print("password  is $password");
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress, password: password);


          if(credential.user == null){
            toastInfo(msg: 'You need to fill in email address.');

          }
          if(!credential.user!.emailVerified){
           await credential.user!.sendEmailVerification();
            toastInfo(msg: 'User is not verified.');
          }
          var user = credential.user;
          if(user != null){
            print("credential.user ${user}");
          //  print("context.mounted ${context.mounted}");
            if(context.mounted) {
             // print("context.mounted ${context.mounted}");
              Navigator.of(context).push( MaterialPageRoute(builder: (_) => ApplicationPage())) ;
            }
          }else {
            toastInfo(msg: "You don/n't exist.");
          }
        }on FirebaseAuthException catch(e){

         if (e.code == 'wrong-password'){
           toastInfo(msg: 'You entered wrong password!');
          } else if (e.code == 'invalid-email'){
           toastInfo(msg: 'You entered wrong email!');
          } else if (e.code == 'invalid-credential'){
           toastInfo(msg: 'No user found for that email!');
          }
          print(e.code);

        }
      }
      // email end
    }
    catch(r) {
      print(r);
    }
  }
}
