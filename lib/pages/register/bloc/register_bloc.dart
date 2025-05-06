import 'package:bloc/bloc.dart';
import 'package:u_learn/pages/register/bloc/register_events.dart';
import 'package:u_learn/pages/register/bloc/register_states.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterStates>{
RegisterBloc():super(RegisterStates(){
  on<UserNameEvent>(_userNameEvent);
  on<EmailEvent>((event, emit) => _emailEvent(event, emit));
  on<PasswordEvent>(_passwordEvent);
  on<RePasswordEvent>(_re_passwordEvent);
});
void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(username:event.username));
}

void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(email:event.email));
}

void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(password:event.password));
}
void _re_passwordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(rePassword:event.renter_password));
}
}