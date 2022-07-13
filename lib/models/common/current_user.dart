class CurrentUser {
  int? id;
  int? universityId;
  String? idToken;
  String? email;
  String? fullname;
  String? avatar;

  CurrentUser(
      {this.id,
      this.universityId,
      this.idToken,
      this.email,
      this.fullname,
      this.avatar});

  CurrentUser get currentUser => CurrentUser(
      id: id,
      universityId: universityId,
      idToken: idToken,
      email: email,
      fullname: fullname,
      avatar: avatar);

  void reset() {
    id = 0;
    universityId = 0;
    idToken = "";
    email = "";
    fullname = "";
    avatar = "";
  }
}
