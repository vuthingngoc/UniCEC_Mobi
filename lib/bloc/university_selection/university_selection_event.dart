import 'package:unicec_mobi/models/entities/user/complete_profile.dart';

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

class CompeletelyProfile extends UniversitySelectionEvent {
  final CompleteProfile completeProfileModel;
  CompeletelyProfile({required this.completeProfileModel});
}

class ChangeDropdownValue extends UniversitySelectionEvent {
  final int newValue;
  ChangeDropdownValue({required this.newValue});
}

//navigate - xử lý ngoài giao diện
class NavigatorWelcomePageEvent extends UniversitySelectionEvent {}

class ShowingSnackBarEvent extends UniversitySelectionEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
