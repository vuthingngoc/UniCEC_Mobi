import 'package:equatable/equatable.dart';
import 'package:unicec_mobi/models/entities/user/user_model.dart';

class MyAccountState extends Equatable{
  UserModel user;

  MyAccountState({required this.user});

  MyAccountState copyWith(UserModel user){
    return MyAccountState(user: user);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}