import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicec_mobi/models/common/current_user.dart';

import '../../services/i_services.dart';
import '../../utils/base_bloc.dart';
import '../../utils/firebase.dart';
import '../../utils/utils.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final ILoginService service;

  LoginBloc(this.service) : super(LoginState(errorEmail: '')) {
    on((event, emit) async {
      if (event is SignInGoogleEvent) {
        UserCredential? credential = await FirebaseUtils.signInWithGoogle();
        if (credential != null) {
          bool check = await saveUserData(credential.user);

          listener.add(NavigatorWelcomePageEvent());
        }
      }
    });
  }

  Future<bool> saveUserData(User? credentialUser) async {
    String? idToken = await credentialUser?.getIdToken();
    String? imagePath = credentialUser?.photoURL;

    String? authToken = await service.getJWTToken(idToken);
    Map<String, dynamic> userMap = Utils.fromJWT(authToken!);

    CurrentUser user = GetIt.I.get<CurrentUser>();
    user.id = int.parse(userMap['id']);
    user.idToken = idToken;
    user.universityId = userMap['university_id'];
    user.email = userMap['email'];
    user.fullname = userMap['fullname'];
    user.avatar = imagePath;
    if (user.universityId == 0) {
      return false;
    } else {
      return true;
    }
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
