import 'package:unicec_mobi/models/entities/user/complete_profile.dart';

import '../../models/entities/temp/temp.dart';

class UniversitySelectionEvent {}

class RecieveData extends UniversitySelectionEvent {
  final List<UniBelongToEmail> listUniBelongToEmail;
  RecieveData({required this.listUniBelongToEmail});
}

//bỏ hàm này
class SelectUniversity extends UniversitySelectionEvent {
  final UniBelongToEmail uniSelection;
  SelectUniversity({required this.uniSelection});
}

class CompeletelyProfile extends UniversitySelectionEvent {
  final CompleteProfile completeProfileModel;
  CompeletelyProfile({required this.completeProfileModel});
}

class ChangeDropdownValueUni extends UniversitySelectionEvent {
  final int newValue;
  ChangeDropdownValueUni({required this.newValue});
}

class ChangeDropdownValueDep extends UniversitySelectionEvent {
  final int newValue;
  ChangeDropdownValueDep({required this.newValue});
}

//navigate - xử lý ngoài giao diện
class NavigatorWelcomePageEvent extends UniversitySelectionEvent {}

class ShowingSnackBarEvent extends UniversitySelectionEvent {
  final String message;

  ShowingSnackBarEvent({required this.message});
}
