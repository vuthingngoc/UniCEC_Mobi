import '../../models/entities/temp/temp.dart';

abstract class ILoginService {
  //get jwt token authentication
  Future<Temp?> getTemp(String? idToken);
}
