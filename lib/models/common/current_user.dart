class CurrentUser {
  int? id;
  int? universityId;
  String? token;
  String? email;
  String? fullname;
  String? avatar;

  CurrentUser(
      {this.id,
      this.universityId,
      this.token,
      this.email,
      this.fullname,
      this.avatar});

  CurrentUser get currentUser => CurrentUser(
      id: id,
      universityId: universityId,
      token: token,
      email: email,
      fullname: fullname,
      avatar: avatar);

  void reset() {
    id = 0;
    universityId = 0;
    token = "";
    email = "";
    fullname = "";
    avatar = "";
  }
}

