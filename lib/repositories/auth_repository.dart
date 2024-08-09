import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<User> login(String email, String password) async {
    final response = await authService.login(email, password);
    return User.fromJson(response);
  }

  Future<User> register(String name, String email, String password, String confirmPassword) async {
    final response = await authService.register(name, email, password, confirmPassword);

    if (response != null && response['user'] != null) {
      return User.fromJson(response['user']); // Assuming `User.fromJson` creates a `User` object from JSON
    } else {
      throw Exception('Registration failed');
    }
  }
  Future<void> logout() async {
    await authService.logout();
  }
}
