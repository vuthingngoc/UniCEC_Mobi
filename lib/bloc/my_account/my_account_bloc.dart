import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/my_account/my_account_event.dart';
import 'package:unicec_mobi/bloc/my_account/my_account_state.dart';
import 'package:unicec_mobi/models/entities/department/department_model.dart';
import 'package:unicec_mobi/models/entities/university/university_model.dart';
import 'package:unicec_mobi/models/enums/user_status.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/common/current_user.dart';
import '../../models/entities/user/user_model.dart';
import '../../utils/log.dart';

class MyAccountBloc extends BaseBloc<MyAccountEvent, MyAccountState> {
  final IUserService service;

  MyAccountBloc({required this.service})
      : super(MyAccountState(
            user: UserModel(
                id: 0,
                avatar: '',
                description: '',
                dob: '',
                email: '',
                fullname: '',
                gender: '',
                isOnline: false,
                phoneNumber: '',
                roleId: 3,
                status: UserStatus.InActive,
                studentCode: '',
                departmentId: 0,
                universityId: 0))) {
    on((event, emit) async {
      if (event is LoadInfoAccountEvent) {
        print('LoadProfileEvent is running ...');
        CurrentUser currentUser = GetIt.I.get<CurrentUser>().currentUser;
        UserModel? user = await service.getById(currentUser.id);
        UniversityModel? university = await service.GetUniById(currentUser.universityId!);
        DepartmentModel? department = await service.GetDepartmentById((user?.departmentId)!);
        if (user != null) {
          emit(state.copyWith(user, university?.name, department?.name));
        } else {
          Log.error('ProfileBloc: user null');
        }
      }
    });
  }
}