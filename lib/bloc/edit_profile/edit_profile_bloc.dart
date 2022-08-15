import 'package:unicec_mobi/bloc/edit_profile/edit_profile_event.dart';
import 'package:unicec_mobi/bloc/edit_profile/edit_profile_state.dart';
import 'package:unicec_mobi/models/common/paging_request.dart';
import 'package:unicec_mobi/models/common/paging_result.dart';
import 'package:unicec_mobi/models/common/resultCRUD.dart';
import 'package:unicec_mobi/models/entities/department/department_model.dart';
import 'package:unicec_mobi/models/entities/user/user_model.dart';
import 'package:unicec_mobi/services/i_services.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

import '../../models/enums/user_status.dart';
import '../../utils/log.dart';

class EditProfileBloc extends BaseBloc<EditProfileEvent, EditProfileState> {
  final IUserService service;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  EditProfileBloc({required this.service})
      : super(EditProfileState(
            user: UserModel(
                id: 0,
                roleId: 0,
                fullname: '',
                email: '',
                avatar: '',
                gender: '',
                studentCode: '',
                phoneNumber: '',
                status: UserStatus.InActive,
                dob: '',
                description: '',
                isOnline: false))) {
    on(((event, emit) async {
      if (event is LoadProfileEvent) {
        print('LoadProfileEvent is running ...');
        _isLoading = true;
        UserModel? user = await service.getById(event.userId);
        emit(state.copyWith(user: user, departments: state.departments));
        _isLoading = false;
      }

      if (event is EditInfoEvent) {
        _isLoading = true;
        ResultCRUD result = await service.updateUser(event.user);
        Log.info('result edit info user: ${result.errorMessage}');
        emit(state.copyWith(isSuccess: result.check));
        listener.add(ShowPopUpAnnouncement(message: result.errorMessage));
        _isLoading = false;
      }

      if (event is LoadDepartmentsByUni) {
        _isLoading = true;
        PagingResult<DepartmentModel>? departments =
            await service.loadDepartmentsByUni(event.universityId);
        Log.info('departments: $departments');
        emit(state.copyWith(departments: departments?.items, user: state.user));
        _isLoading = false;
      }

      if (event is ChangeSelectionDepartment) {
        emit(state.copyWith(
            newValueDep: state.newValueDep,
            user: state.user,
            departments: state.departments,
            isSuccess: state.isSuccess,
            selectedDepartment: state.selectedDepartment));
      }
    }));
  }
}
