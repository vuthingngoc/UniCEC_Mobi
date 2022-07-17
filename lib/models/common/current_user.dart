import '../entities/club/club_model.dart';

class CurrentUser {
  int? id;
  int? universityId;
  String? idToken;
  String? email;
  String? fullname;
  String? avatar;
  //
  List<ClubModel>? clubsBelongToStudent;
  int? clubIdSelected;

  CurrentUser(
      {this.id,
      this.universityId,
      this.idToken,
      this.email,
      this.fullname,
      this.avatar,
      this.clubsBelongToStudent,
      this.clubIdSelected});

  CurrentUser get currentUser => CurrentUser(
      id: id,
      universityId: universityId,
      idToken: idToken,
      email: email,
      fullname: fullname,
      avatar: avatar,
      clubsBelongToStudent: clubsBelongToStudent,
      clubIdSelected: clubIdSelected);

  void reset() {
    id = 0;
    universityId = 0;
    idToken = "";
    email = "";
    fullname = "";
    avatar = "";
    clubsBelongToStudent = [];
    clubIdSelected = 0;
  }
}
