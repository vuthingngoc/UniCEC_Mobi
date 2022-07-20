import 'package:equatable/equatable.dart';

import '../../models/entities/user/user_model.dart';

class ProfileState extends Equatable{ // this function is no use anymore now
  UserModel user;

  ProfileState({required this.user});

  ProfileState copyWith(UserModel user){
    return ProfileState(user: user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];

}