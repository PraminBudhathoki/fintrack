// abstract class LoginEvent {}
// class LoginTextChangedEvent extends LoginEvent{
//   final String emailValue;
//   final String passwordValue;
//   LoginTextChangedEvent(this.emailValue,this.passwordValue);
// }
// class LoginInitialEvent extends LoginEvent{}

// class LoginSubmittedEvent extends LoginEvent{
//   final String email;
//   final String password;
//   LoginSubmittedEvent(this.email,this.password);
// }


abstract class LoginEvent {}
class LoginTextChangedEvent extends LoginEvent{
  final String emailValue;
  final String passwordValue;
  LoginTextChangedEvent(this.emailValue,this.passwordValue);
}
class LoginInitialEvent extends LoginEvent{}

class LoginSubmittedEvent extends LoginEvent{
  final String email;
  final String password;
  LoginSubmittedEvent(this.email,this.password);
}

class LoginFailedEvent extends LoginEvent {
  final String errorMessage;
  LoginFailedEvent(this.errorMessage);
}

