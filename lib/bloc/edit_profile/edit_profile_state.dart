import 'package:equatable/equatable.dart';

import '../../models/entities/department/department_model.dart';
import '../../models/entities/user/user_model.dart';

class EditProfileState extends Equatable{
  UserModel? user;
  List<DepartmentModel>? departments;
  bool? isSuccess;
  DepartmentModel? selectedDepartment;

  EditProfileState({this.user, this.departments, this.isSuccess, this.selectedDepartment});

  EditProfileState copyWith({UserModel? user, List<DepartmentModel>? departments ,bool? isSuccess, DepartmentModel? selectedDepartment}){
    return EditProfileState(user: user, departments: departments, isSuccess: isSuccess, selectedDepartment: selectedDepartment);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [user, departments, isSuccess, selectedDepartment];

}