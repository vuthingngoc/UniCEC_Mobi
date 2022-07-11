import 'package:unicec_mobi/models/enums/user_status.dart';

class UserModel {
  int id;
  int roleId;
  int? universityId;
  String fullname;
  String avatar;
  String gender;
  int? majorId;
  String studentCode;
  String phoneNumber;
  UserStatus status;
  String dob;
  String description;
  bool isOnline;

  UserModel(
      {required this.id,
      required this.roleId,
      this.universityId,
      required this.fullname,
      required this.avatar,
      required this.gender,
      this.majorId,
      required this.studentCode,
      required this.phoneNumber,
      required this.status,
      required this.dob,
      required this.description,
      required this.isOnline});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    int roleId = json['role_id'];
    int? universityId = json['university_id'];
    String fullname = json['fullname'];
    String avatar = json['avatar'];
    String gender = json['gender'];
    int? majorId = json['major_id'];
    String studentCode = json['student_code'];
    String phoneNumber = json['phone_number'];
    UserStatus status = json['status'];
    String dob = json['dob'];
    String description = json['description'];
    bool isOnline = json['is_online'];

    return UserModel(
      id: id, 
      roleId: roleId, 
      fullname: fullname, 
      avatar: avatar, 
      gender: gender, 
      studentCode: studentCode, 
      phoneNumber: phoneNumber, 
      status: status, 
      dob: dob, 
      description: description, 
      isOnline: isOnline
    );
  }
}
