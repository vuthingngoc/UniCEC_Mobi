import 'package:equatable/equatable.dart';

import '../../models/entities/department/department_model.dart';
import '../../models/entities/user/user_model.dart';

class EditProfileState extends Equatable{
  UserModel? user;
  List<DepartmentModel>? departments;
  bool? isSuccess;
  DepartmentModel? selectedDepartment;
  int? newValueDep;

  EditProfileState({this.user, this.departments, this.isSuccess, this.selectedDepartment, this.newValueDep});

  EditProfileState copyWith({UserModel? user, List<DepartmentModel>? departments ,bool? isSuccess, DepartmentModel? selectedDepartment, int? newValueDep}){
    return EditProfileState(user: user, departments: departments, isSuccess: isSuccess, selectedDepartment: selectedDepartment, newValueDep: newValueDep);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [user, departments, isSuccess, selectedDepartment, newValueDep];

}