import 'package:ezy_buy_admin_font_end/features/auth/login/domain/entities/user.dart';

abstract class AuthRepositories {
  Future<User> login({required String email, required String password});
}
