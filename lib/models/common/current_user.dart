class CurrentUser{
  int id;
  int universityId;
  String token;
  String email;
  String fullname;
  String avatar;

  CurrentUser({
    required this.id,
    required this.universityId,
    required this.token,
    required this.email,
    required this.fullname,
    required this.avatar
  });

  void reset(){
    id = 0;
    universityId = 0;
    token = "";
    email = "";
    fullname = "";
    avatar = "";
  }
}