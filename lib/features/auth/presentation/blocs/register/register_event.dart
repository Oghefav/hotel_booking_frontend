abstract class RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  const RegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}

class Register extends RegisterEvent {
  const Register({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.password,
    required super.confirmPassword,
  });
}