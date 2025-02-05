import '../models/user_model.dart';

class UserRepository {
  Future<User> fetchUser() async {
    // Giả lập việc gọi API và trả về dữ liệu
    await Future.delayed(Duration(seconds: 2)); // Giả lập delay
    return User(id: 1, name: "John Doe", email: "johndoe@example.com");
  }
}
