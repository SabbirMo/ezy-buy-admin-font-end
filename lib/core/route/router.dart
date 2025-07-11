import '../../src/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/features/auth/presentation/views/auth_view.dart';
import '../di/injection_container.dart';
import 'router_constant.dart';

final router = GoRouter(
  navigatorKey: getIt<GlobalKey<NavigatorState>>(),
  initialLocation: RouterConstant.login,
  routes: [
    // GoRoute(
    //   path: RouterConstant.splash,
    //   builder: (context, state) => const SplashScreen(),
    // ),
    GoRoute(
      path: RouterConstant.login,
      builder: (context, state) => AuthView(),
    ),
    GoRoute(
      path: RouterConstant.dashboardView,
      builder: (context, state) => DashboardView(),
    ),
  ],
);
