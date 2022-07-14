import '../../models/entities/temp/temp.dart';

class UniversitySelectionEvent {}

class RecieveData extends UniversitySelectionEvent {
  final List<UniBelongToEmail> listUniBelongToEmail;
  RecieveData({required this.listUniBelongToEmail});
}

class SelectUniversity extends UniversitySelectionEvent {
  final UniBelongToEmail uniSelection;
  SelectUniversity({required this.uniSelection});
}

//navigate - xử lý ngoài giao diện
class NavigatorWelcomePageEvent extends UniversitySelectionEvent {}

class ShowingSnackBarEvent extends UniversitySelectionEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
