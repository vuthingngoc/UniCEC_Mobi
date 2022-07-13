abstract class ILoginService {
  //get jwt token authentication
  Future<String?> getJWTToken(String? idToken);
}
