import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:u_learn/common/widgets/flutter_toast.dart';
class RegisterController{
    final BuildContext context;
   const RegisterController(this.context);

   void handleEmailRegister() async {
     final state = context.read<RegisterBloc>().state;
     String username = state.username;
     String password = state.password;
     String email = state.email;
     String rePassword = state.rePassword;
     if(username.isEmpty){
       toastInfo(msg: "User name cannot be empty");
       return;
     }
     if(email.isEmpty){
       toastInfo(msg: "Email cannot be empty");
       return;
     }
     if(password.isEmpty){
       toastInfo(msg: "Password cannot be empty");
       return;
     }
     if(rePassword.isEmpty){
       toastInfo(msg: "Password confirmation cannot be empty");
       return;
     }
     try {
      final credential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null)  {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(username);
        toastInfo(msg: "An email has been sent to your registered email. "
            "To activate it click on the link send to email box.");
        Navigator.of(context).pop();
      }
     }
     on FirebaseAuthException catch(e){
    if(e.code == 'weak-password'){
      toastInfo(msg: "The password  provided is too weak");
    } else if(e.code == 'email-already-in-use'){
      toastInfo(msg: "The email is already in use.");
    } else if(e.code == 'email-invalid'){
      toastInfo(msg: "The email is not correct.");
    }
     }
   }
}