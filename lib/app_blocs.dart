import 'package:u_learn/app_events.dart';
import 'package:u_learn/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppBloc extends Bloc<AppEvents, AppStates>{
  AppBloc():super(InitStates()){
    on<Increment>((event, emit){
     emit(AppStates(counter: state.counter+1));
    });
    on<Decrement>((event, emit){
      emit(AppStates(counter: state.counter-1));
    });
  }
}