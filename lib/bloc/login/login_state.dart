import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  String errorEmail;

  LoginState({
    required this.errorEmail,
  });

  LoginState copyWith(
      {bool? isValidEmail,
      bool? isValidPassword,
      String? errorEmail,
      String? errorPassword}) {
    return LoginState(
      errorEmail: errorEmail ?? this.errorEmail,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [errorEmail];
}
