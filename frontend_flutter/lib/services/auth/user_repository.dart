class UserRepository {
  Future<String> authenticate(
      {required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    return "authenticate";
  }
}
