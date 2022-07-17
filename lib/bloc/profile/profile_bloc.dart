import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/bloc/profile/profile_event.dart';
import 'package:unicec_mobi/bloc/profile/profile_state.dart';
import 'package:unicec_mobi/models/common/current_user.dart';
import 'package:unicec_mobi/models/entities/user/user_model.dart';
import 'package:unicec_mobi/models/enums/user_status.dart';
import 'package:unicec_mobi/services/user_svc/i_user_service.dart';
import 'package:unicec_mobi/utils/base_bloc.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final IUserService service;

  ProfileBloc(this.service)
      : super(ProfileState(user: UserModel(
            id: 0,
            roleId: 0,
            fullname: '',
            avatar: '',
            gender: '',
            studentCode: '',
            phoneNumber: '',
            status: UserStatus.InActive,
            dob: '',
            description: '',
            isOnline: false))) {
              on((event, emit) async {
                if(event is LoadProfileEvent){
                  print('LoadProfileEvent is running ...');
                  CurrentUser currentUser = GetIt.I.get<CurrentUser>().currentUser;
                  UserModel user = await service.getById(currentUser.id);
                  emit(state.copyWith(user));
                }
              });
            }
}
