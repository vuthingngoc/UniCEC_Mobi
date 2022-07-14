import 'package:get_it/get_it.dart';

import '../services/i_services.dart';
import '../services/services.dart';

class ServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ICityService>(() => CityService());

    //import splash service
    injector.registerFactory<ISplashService>(() => SplashService());

    //import login service
    injector.registerFactory<ILoginService>(() => LoginService());

    //import unversity_selection_service
    injector.registerFactory<IUniversitySelectionService>(
        () => UniversitySelectionService());
  }
}
