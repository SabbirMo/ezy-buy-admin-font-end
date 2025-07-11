import 'package:ezy_buy_admin_font_end/features/auth/login/data/model/user_model.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/data/services/auth_services.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/domain/entities/user.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl extends AuthRepositories {
  final AuthServices services;

  AuthRepositoriesImpl(this.services);

  @override
  Future<User> login({required String email, required String password}) async {
    final json = await services.login(email: email, password: password);
    return UserModel.fromJson(json);
  }
}
