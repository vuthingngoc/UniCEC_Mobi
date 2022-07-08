import 'package:equatable/equatable.dart';

class LoginState extends Equatable{
  bool isValidEmail;
  bool isValidPassword;
  String errorEmail;
  String errorPassword;

  LoginState({
    required this.isValidEmail,
    required this.isValidPassword,
    required this.errorEmail,
    required this.errorPassword
  });

  LoginState copyWith(
    {
      bool? isValidEmail,
      bool? isValidPassword,
      String? errorEmail,
      String? errorPassword  
    }
  ){
    return LoginState(
      isValidEmail: isValidEmail ?? this.isValidEmail, 
      isValidPassword: isValidPassword ?? this.isValidPassword, 
      errorEmail: errorEmail ?? this.errorEmail, 
      errorPassword: errorPassword ?? this.errorPassword
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isValidEmail, isValidPassword, errorEmail, errorPassword];

}