abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  
  LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String password;

  SignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.password,
  });
}

