class LoginEvent {}

class SignInGoogleEvent extends LoginEvent {}

class NavigatorWelcomePageEvent extends LoginEvent {}

class ShowingSnackBarEvent extends LoginEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
