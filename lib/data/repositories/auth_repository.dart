class AuthRepository {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != "test@example.com" || password != "password") {
      throw Exception("Invalid credentials");
    }
  }

  Future<void> signUp(String firstName, String lastName, String email, String mobile, String password) async {
  await Future.delayed(const Duration(seconds: 2));
  if (email == "exists@example.com") {
    throw Exception("Email already exists");
  }
}

}
