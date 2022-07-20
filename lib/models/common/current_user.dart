import 'package:unicec_mobi/screens/size_config.dart';

import '../entities/club/club_model.dart';

class CurrentUser {
  int id;
  int? universityId;
  String? universityName;
  String idToken;
  String email;
  String fullname;
  String? avatar;
  //
  List<ClubModel>? clubsBelongToStudent;
  int? clubIdSelected;

  CurrentUser({
    required this.id,
    this.universityId,
    this.universityName,
    required this.idToken,
    required this.email,
    required this.fullname,
    this.avatar,
    this.clubsBelongToStudent,
    this.clubIdSelected,
  });

  CurrentUser get currentUser => CurrentUser(
      id: id,
      universityId: universityId,
      universityName: universityName,
      idToken: idToken,
      email: email,
      fullname: fullname,
      avatar: avatar,
      clubsBelongToStudent: clubsBelongToStudent,
      clubIdSelected: clubIdSelected);

  void reset() {
    id = 0;
    universityId = 0;
    universityName = '';
    idToken = "";
    email = "";
    fullname = "";
    avatar = "";
    clubsBelongToStudent = [];
    clubIdSelected = null;
  }
}
