import 'package:unicec_mobi/bloc/university_selection/university_selection_event.dart';
import 'package:unicec_mobi/bloc/university_selection/university_selection_state.dart';
import 'package:unicec_mobi/services/i_services.dart';

import '../../models/entities/department/department_model.dart';
import '../../utils/base_bloc.dart';

class UniversitySelectionBloc
    extends BaseBloc<UniversitySelectionEvent, UniversitySelectionState> {
  final IUniversitySelectionService service;

  UniversitySelectionBloc(this.service)
      : super(UniversitySelectionState(
            listUniBelongToEmail: [],
            listDepartment: [],
            dropdownNewValueDep: -1,
            dropdownNewValueUni: -1,
            universityId: -1,
            departmentId: -1,
            description: '',
            gender: '',
            phone: '',
            studentCode: '',
            dob: '')) {
    on((event, emit) async {
      //Recieve data
      if (event is RecieveData) {
        // TODO: implement
        //set state emit ra ngoài
        emit(state.copyWith(
            listUniBelongToEmail: event.listUniBelongToEmail, // -> change
            listDepartment: state.listDepartment,
            dropdownNewValueDep: state.dropdownNewValueDep,
            dropdownNewValueUni: state.dropdownNewValueUni,
            universityId: state.universityId,
            departmentId: state.departmentId,
            description: state.description,
            gender: state.gender,
            phone: state.phone,
            studentCode: state.studentCode,
            dob: state.dob));
      }

      //Change dropDown value Uni
      if (event is ChangeDropdownValueUni) {
        //auto get Department theo event.newValue
        List<DepartmentModel>? GetListDepartmentByUni =
            await service.getDepartmentByUni(event.newValue);

        emit(state.copyWith(
            listUniBelongToEmail: state.listUniBelongToEmail,
            listDepartment: GetListDepartmentByUni!, // ->change
            dropdownNewValueDep: event.newValue, // -> change
            dropdownNewValueUni: state.dropdownNewValueUni,
            universityId: state.universityId,
            departmentId: state.departmentId,
            description: state.description,
            gender: state.gender,
            phone: state.phone,
            studentCode: state.studentCode,
            dob: state.dob));
      }

      //Change dropDown value Dep
      if (event is ChangeDropdownValueDep) {
        emit(state.copyWith(
            listUniBelongToEmail: state.listUniBelongToEmail,
            listDepartment: state.listDepartment,
            dropdownNewValueDep: event.newValue, // -> change
            dropdownNewValueUni: state.dropdownNewValueUni,
            universityId: state.universityId,
            departmentId: state.departmentId,
            description: state.description,
            gender: state.gender,
            phone: state.phone,
            studentCode: state.studentCode,
            dob: state.dob));
      }

      //hàm update
      //Select University
      if (event is CompeletelyProfile) {
        bool check = await service.completeProfile(event.completeProfileModel);
        if (check) {
          listener.add(NavigatorWelcomePageEvent());
        } else {
          listener.add(ShowingSnackBarEvent(message: "Lỗi Chọn Trường"));
        }
      }
    });
  }
}
