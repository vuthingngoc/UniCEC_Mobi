import '../../models/entities/user/user_model.dart';

abstract class IUserService{
  Future<UserModel?> getById(int id); 
}