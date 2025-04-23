import 'package:bloc/bloc.dart';
import 'package:u_learn/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learn/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) => _emailEvent(event, emit));
    on<PasswordEvent>((event, emit) => _passwordEvent(event, emit));
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
