import 'package:unicec_mobi/models/entities/department/department_model.dart';
import 'package:unicec_mobi/models/entities/university/university_model.dart';

import '../../models/entities/user/user_model.dart';

abstract class IUserService{
  Future<UserModel?> getById(int id);
  Future<UniversityModel?> GetUniById(int universityId);
  Future<DepartmentModel?> GetDepartmentById(int departmentId);
}