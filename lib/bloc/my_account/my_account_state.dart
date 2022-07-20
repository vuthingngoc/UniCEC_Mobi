import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/user/user_model.dart';

class MyAccountState extends Equatable{
  UserModel user;
  String? universityName;
  String? departmentName;

  MyAccountState({required this.user, this.universityName, this.departmentName});

  MyAccountState copyWith(UserModel user, String? universityName, String? departmentName){
    return MyAccountState(user: user, universityName: universityName, departmentName: departmentName);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}