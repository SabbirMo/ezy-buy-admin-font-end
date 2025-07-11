import 'package:ezy_buy_admin_font_end/features/auth/login/data/repositories/auth_repositories_impl.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/data/services/auth_services.dart';
import 'package:ezy_buy_admin_font_end/features/auth/login/domain/usecases/login_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

final passwordControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

//hiden and show password
final hidenPassword = StateProvider<bool>((ref) => false);

final authServicesProvider = Provider<AuthServices>((ref) => AuthServices());

final authRepositoryProvider = Provider<AuthRepositoriesImpl>((ref) {
  final services = ref.read(authServicesProvider);
  return AuthRepositoriesImpl(services);
});

final loginUseCaseProvider = Provider<LoginUsecases>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginUsecases(repo);
});

final loginProvider =
    FutureProvider.family<String, Map<String, dynamic>>((ref, cre) async {
  final loginCase = ref.read(loginUseCaseProvider);
  final data = await loginCase(cre['email']!, cre['password']!);
  return data.token;
});
