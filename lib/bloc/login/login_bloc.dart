import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:unicec_mobi/models/common/current_user.dart';

import '../../models/entities/authenicator_user/authenicator_user_model.dart';
import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import '../../utils/firebase.dart';
import '../../utils/utils.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final ILoginService service;

  LoginBloc({required this.service}) : super(LoginState(errorEmail: '')) {
    on((event, emit) async {
      if (event is SignInGoogleEvent) {
        UserCredential? credential = await FirebaseUtils.signInWithGoogle();
        if (credential != null) {
          //xử lý logic ở chỗ này
          //1.Nếu chưa đăng nhập thì sẽ trả ra model tạm gồm jwt và list
          //2.Nếu đăng nhập rồi thì trả ra String idToken thôi
          //3.Trường hợp lỗi

          AuthenicatorUserModel? temp = await saveUserData(credential.user);
          if (temp!.listUniBelongToEmail.isEmpty) {
            listener.add(NavigatorWelcomePageEvent());
          } else {
            listener.add(NavigatorUniversitySelectionPageEvent(
                listUniBelongToEmail: temp.listUniBelongToEmail));
          }
        }
      }
    });
  }

  Future<AuthenicatorUserModel?> saveUserData(User? credentialUser) async {
    String? idToken = await credentialUser?.getIdToken();
    String? imagePath = credentialUser?.photoURL;

    //chứa cả Token + List University
    AuthenicatorUserModel? temp = await service.getTemp(idToken);

    //decode JWT
    Map<String, dynamic> userMap = Utils.fromJWT(temp?.token);
    CurrentUser user = GetIt.I.get<CurrentUser>();
    user.id = int.parse(userMap['Id']);
    user.idToken = temp?.token;

    //if new student kh trả ra UniversityID -> sẽ được cập nhật bên trang UniSelection
    if (temp!.listUniBelongToEmail.isEmpty) {
      //
      user.universityId = int.parse(userMap['UniversityId']);
      //load list club belong to student
      user.clubsBelongToStudent =
          await service.getListClubsBelongToStudent(user.id);
    }

    user.email = userMap['Email'];
    user.fullname = userMap['Fullname'];
    user.avatar = imagePath;

    return temp;

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // List<String> userInfo = [
    //   "${user.id}",
    //   idToken,
    //   user.email,
    //   user.fullname,
    //   user.phone,
    //   user.imagePath
    // ];
    // await preferences.setStringList("userInfo", userInfo);
    //await FirebaseUtils.saveUserImage(user.id, user.imagePath);
  }
}
