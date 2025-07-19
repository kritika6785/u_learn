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

import '../../app_blocs.dart';


/*
class AppPages{
  static List<PageEntity> routes () {
    return [
      PageEntity(route: AppRoutes.INITIAL, page: Welcome(), bloc: BlocProvider(create: (_)=> WelcomeBloc(), child: Welcome(),),),
      PageEntity(route: AppRoutes.SIGN_IN, page: SignIn(), bloc: BlocProvider(create: (_)=> SignInBloc(),child: SignIn(),)),
      PageEntity(route: AppRoutes.REGISTER, page: Register(), bloc: BlocProvider(create: (_)=> RegisterBloc(), child: Register(),)),
   //   PageEntity(route: AppRoutes.APPLICATION, page: ApplicationPage()),
    ];
  }
// return all the bloc providers
  static List<BlocProvider> allBlocProviders(BuildContext context){
    List<BlocProvider> blocProviders = <BlocProvider>[];
    for(var bloc in routes()){
      if(bloc.bloc  !=  null) {
        blocProviders.add(bloc.bloc!);
      }
    }
    return blocProviders;
  }
  // a modal that covers an entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name != null){
      var result = routes().where((element)=> element.route== settings.name);
   if(result.isNotEmpty){
     return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
   }

    }
    return MaterialPageRoute(builder: (_)=> BlocProvider(
      create: (context) => SignInBloc(),
      child: SignIn(),
    ), settings: settings);
  }
}

// unify all bloc providers, pages and routes
class PageEntity{
  String route;
  Widget page;
  BlocProvider? bloc;
  PageEntity({ required this.route,
   required this.page,
     this.bloc});
}
*/




class AppPages {
  // This method should return all the BlocProviders needed at the root of your app
  static List<BlocProvider> allBlocProviders(BuildContext context) {
    return [
      // Add WelcomeBloc here!
      BlocProvider<WelcomeBloc>(create: (context) => WelcomeBloc()),
      // Add other BlocProviders as needed for your application
      BlocProvider<RegisterBloc>(create: (context)=>RegisterBloc()),
      BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
    //  BlocProvider<AppBloc>(create: (context) => AppBloc()), // If MyHomePage is used
      // ... more BlocProviders
    ];
  }

  // This method handles generating routes based on route settings
  static Route<dynamic> generateRouteSettings(RouteSettings settings) {
    // Define your routes here
    switch (settings.name) {
      case AppRoutes.INITIAL:
        return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
      case AppRoutes.SIGN_IN:
        return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
      case AppRoutes.REGISTER:
        return MaterialPageRoute(builder: (_) => Register(), settings: settings);
      case AppRoutes.APPLICATION:
        return MaterialPageRoute(builder: (_) => ApplicationPage(), settings: settings);
    // Add other routes as needed
      default:
      // Handle unknown routes, e.g., show a 404 page
      return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
       // return MaterialPageRoute(builder: (_) => ApplicationPage(), settings: settings);
    }
  }
}


