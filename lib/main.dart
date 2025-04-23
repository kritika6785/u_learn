import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learn/app_states.dart';
import 'package:u_learn/app_events.dart';
import 'package:u_learn/app_blocs.dart';
import 'package:u_learn/pages/welcome/welcome.dart';
import 'package:u_learn/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/pages/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_blocs.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(lazy:false, create: (context)=> WelcomeBloc(),),
      BlocProvider(lazy:false, create: (context)=> AppBloc(),),
      BlocProvider( create: (context)=> SignInBloc(),),

    ],
    child: ScreenUtilInit(builder: (context, widget)=> MaterialApp(
      debugShowCheckedModeBanner:false,
      routes:{
        "myHomePage":(context)=>MyHomePage(),
        "sign-in":(context)=>SignIn(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Welcome(),
    ),)
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Flutter Demo Home Page"),
      ),
      body: Center(

        child: BlocBuilder<AppBloc, AppStates>(builder: (context, state){
          return Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                "${BlocProvider.of<AppBloc>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'tag1',
            onPressed: ()=> BlocProvider.of<AppBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'tag2',
            onPressed: ()=> BlocProvider.of<AppBloc>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// TODO: *****Bloc*****
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: BlocBuilder<AppBloc, AppStates>(builder: (context, state){
//           return Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('You have pushed the button this many times:'),
//               Text(
//                 "${BlocProvider.of<AppBloc>(context).state.counter}",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         }),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             onPressed: ()=> BlocProvider.of<AppBloc>(context).add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: ()=> BlocProvider.of<AppBloc>(context).add(Decrement()),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       )// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
