import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/models/common/current_user.dart';

class CurrentUserDependencies{
  static Future setup(GetIt injector) async {
    injector.registerSingleton<CurrentUser>(CurrentUser(id: 0, email: '', fullname: '', avatar: '', idToken: ''));
  }
}