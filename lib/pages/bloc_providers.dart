import 'package:u_learn/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/app_events.dart';
import 'package:u_learn/app_blocs.dart';
import 'package:u_learn/pages/welcome/welcome.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(lazy:false, create: (context)=> WelcomeBloc(),),
    BlocProvider(lazy:false, create: (context)=> AppBloc(),),
    BlocProvider(create: (context)=> SignInBloc(),),
    BlocProvider(create: (context)=> RegisterBloc(),),
  ];
}