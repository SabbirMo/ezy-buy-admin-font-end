import 'package:ezy_buy_admin_font_end/features/cetagories/presentation/view/cetagories_screen.dart';
import 'package:ezy_buy_admin_font_end/features/coupons/presentation/view/coupon_screen.dart';
import 'package:ezy_buy_admin_font_end/features/customers/presentation/view/customer_screen.dart';
import 'package:ezy_buy_admin_font_end/features/deshboard/presentation/view/deshboard.dart';
import 'package:ezy_buy_admin_font_end/features/globalSetting/presentation/view/global_setting.dart';
import 'package:ezy_buy_admin_font_end/features/home/presentation/view/home_screen.dart';
import 'package:ezy_buy_admin_font_end/features/inbox/presentation/view/index_screen.dart';
import 'package:ezy_buy_admin_font_end/features/knowledgeBase/presentation/view/knowlage_base.dart';
import 'package:ezy_buy_admin_font_end/features/orders/presentation/view/order_screen.dart';
import 'package:ezy_buy_admin_font_end/features/personalSetting/presentation/view/personal_setting.dart';
import 'package:ezy_buy_admin_font_end/features/productUpdates/presentation/view/product_update.dart';
import 'package:ezy_buy_admin_font_end/features/productes/presentation/view/product_screen.dart';
import 'package:ezy_buy_admin_font_end/features/reports/presentation/view/report_screen.dart';
import 'package:go_router/go_router.dart';

class RoutesContants {
  static final String deshboard = '/deshboard';
  static final String orders = '/orders';
  static final String products = '/products';
  static final String categories = '/categories';
  static final String customers = '/customers';
  static final String reports = '/reports';
  static final String coupons = '/coupons';
  static final String inbox = '/inbox';
  static final String knowledgeBase = '/knowledgeBase';
  static final String productUpdates = '/productUpdates';
  static final String personalSettings = '/personalSettings';
  static final String globalSettings = '/globalSettings';
}

final routes = GoRouter(initialLocation: RoutesContants.deshboard, routes: [
  ShellRoute(
    builder: (context, state, child) => HomeScreen(
      child: child,
    ),
    routes: [
      GoRoute(
          path: RoutesContants.deshboard,
          builder: (context, state) => const Deshboard()),
      GoRoute(
          path: RoutesContants.orders,
          builder: (context, state) => const OrderScreen()),
      GoRoute(
          path: RoutesContants.products,
          builder: (context, state) => const ProductScreen()),
      GoRoute(
          path: RoutesContants.categories,
          builder: (context, state) => const CetagoriesScreen()),
      GoRoute(
          path: RoutesContants.customers,
          builder: (context, state) => const CustomerScreen()),
      GoRoute(
          path: RoutesContants.reports,
          builder: (context, state) => const ReportScreen()),
      GoRoute(
          path: RoutesContants.coupons,
          builder: (context, state) => const CouponScreen()),
      GoRoute(
        path: RoutesContants.inbox,
        builder: (context, state) => const InboxScreen(),
      ),
      GoRoute(
          path: RoutesContants.knowledgeBase,
          builder: (context, state) => const KnowlageBase()),
      GoRoute(
          path: RoutesContants.productUpdates,
          builder: (context, state) => const ProductUpdate()),
      GoRoute(
          path: RoutesContants.personalSettings,
          builder: (context, state) => const PersonalSetting()),
      GoRoute(
          path: RoutesContants.globalSettings,
          builder: (context, state) => const GlobalSetting()),
    ],
  )
]);
