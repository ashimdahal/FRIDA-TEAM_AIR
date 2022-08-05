import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Future<String> authenticate(
      {required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    return "authenticate";
  }

  Future<String> logOut() async{
    return "Loggedout";
  }

}
