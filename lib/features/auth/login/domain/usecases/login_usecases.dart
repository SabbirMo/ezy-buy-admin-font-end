import 'package:ezy_buy_admin_font_end/features/auth/login/domain/entities/user.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/domain/repositories/auth_repositories.dart';

class LoginUsecases {
  final AuthRepositories repositories;

  LoginUsecases(this.repositories);

  Future<User> call(String email, String password) {
    return repositories.login(email: email, password: password);
  }
}
