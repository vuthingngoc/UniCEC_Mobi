import 'package:get_it/get_it.dart';
import 'package:unicec_mobi/services/city_svc/i_city_service.dart';

import '../services/city_svc/city_service.dart';

class ServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ICityService>(() => CityService());
    
  }
}
