import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> authenticate(
      {required String email, required String password}) async {
    return "authenticate";
  }

  Future<String> logOut() async {
    return "Loggedout";
  }
}
