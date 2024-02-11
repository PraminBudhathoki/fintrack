import 'package:email_validator/email_validator.dart';
import 'package:fintrack/features/authentication/bloc/login/login_events.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc(): super(LoginInitialState()){
    on<LoginTextChangedEvent>((event,emit)  {
      if(EmailValidator.validate(event.emailValue)==false){
        emit(LoginErrorState("Please enter a valid email address"));
      }else if(event.passwordValue.length <= 8){
        emit(LoginErrorState("Please enter a valid password"));
      }else{
        emit(LoginValidState());
      }
    }
    );
    on<LoginSubmittedEvent>((event,emit)  {
        emit(LoginLoadingState());
    });
  }
}
