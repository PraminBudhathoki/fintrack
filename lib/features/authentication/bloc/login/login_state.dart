abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginActionState extends LoginState {}

class LoginSucessfulNavigateToHomeActionState extends LoginActionState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
  //yo tala ko line paxi rakheko ho hai
  String get error => errorMessage;
}

class LoginLoadingState extends LoginState {}
