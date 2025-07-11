import 'package:ezy_buy_admin_font_end/core/route/router.dart';
import 'package:ezy_buy_admin_font_end/core/route/router_constant.dart';
import 'package:ezy_buy_admin_font_end/core/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utils/custom_toast.dart';
import '../../domain/use_cases/auth_use_case.dart';

class LoginState {
  final bool isLoading;

  LoginState({
    this.isLoading = false,
  });

  LoginState copyWith({
    bool? isLoading,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider(this._doLoginUseCases) : super(LoginState());

  final DoLoginUseCase _doLoginUseCases;

  Future doLoginApiCall(String email, String password) async {
    if (!loginValidation(email, password)) {
      return;
    }

    state = state.copyWith(isLoading: true);

    final result = await _doLoginUseCases.execute(email: email, password: password);

    result.fold((l) {
      state = state.copyWith(isLoading: false);

      CustomToast.errorToast(message: l.message);
    }, (r) async {
      if (r.user?.role?.name?.toLowerCase() == "admin") {
        CustomToast.successToast(message: r.message ?? "");
        await SharedPrefUtil.storeToken(r.token ?? "");

        router.push(RouterConstant.dashboardView);

        state = state.copyWith(isLoading: false);
      } else {
        CustomToast.errorToast(message: "You are not an admin");
      }
    });
  }

  bool loginValidation(String email, String password) {
    if (email.isEmpty) {
      CustomToast.errorToast(message: "Email required");
      return false;
    }

    if (password.isEmpty) {
      CustomToast.errorToast(message: "Password required");
      return false;
    }

    return true;
  }
}

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  final getTokenUseCases = ref.watch(getTokenUseCasesProvider);

  return LoginProvider(getTokenUseCases);
});

final getTokenUseCasesProvider = Provider<DoLoginUseCase>((ref) {
  return GetIt.instance<DoLoginUseCase>();
});

final emailControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

final passwordControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

//hiden and show password
final hidenPassword = StateProvider<bool>((ref) => false);
