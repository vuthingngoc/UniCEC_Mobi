import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  String errorEmail;

  LoginState({
    required this.errorEmail,
  });

  LoginState copyWith({
    required String errorEmail,
  }) {
    return LoginState(errorEmail: errorEmail);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [errorEmail];
}
