import 'package:flutter/material.dart';
import 'package:u_learn/common/routes/names.dart';
import 'package:u_learn/pages/welcome/welcome.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/pages/register/register.dart';
import 'package:u_learn/pages/sign_in/sign_in.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:u_learn/pages/register/bloc/register_bloc.dart';
import 'package:u_learn/pages/application/application_page.dart';


class AppPages{
  static List<PageEntity> routes (){
    return [
      PageEntity(route: AppRoutes.INITIAL, page: Welcome(), bloc: BlocProvider(create: (_)=> WelcomeBloc())),
      PageEntity(route: AppRoutes.SIGN_IN, page: SignIn(), bloc: BlocProvider(create: (_)=> SignInBloc())),
      PageEntity(route: AppRoutes.REGISTER, page: Register(), bloc: BlocProvider(create: (_)=> RegisterBloc())),
      PageEntity(route: AppRoutes.APPLICATION, page: ApplicationPage()),
    ];
  }
// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for(var bloc in routes()){
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({ required this.route,
   required this.page,
    this.bloc});
}