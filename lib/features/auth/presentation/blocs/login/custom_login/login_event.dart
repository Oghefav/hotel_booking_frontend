

abstract class LoginEvent {
  final String email;
  final String password;
  const LoginEvent(this.email, this.password);
}

class Login extends LoginEvent {
  const Login(String email, String password) : super(email, password);
}
