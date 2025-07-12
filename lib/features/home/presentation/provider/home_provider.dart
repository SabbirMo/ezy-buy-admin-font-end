import 'package:ezy_buy_admin_font_end/features/home/data/model/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<HomeModel> cetagories = [
  HomeModel(
      imagePath: 'assets/svg/home.svg',
      title: "Deshboard",
      route: '/deshboard'),
  HomeModel(
      imagePath: 'assets/svg/order.svg', title: "Orders", route: '/orders'),
  HomeModel(
      imagePath: 'assets/svg/product.svg',
      title: "Products",
      route: '/products'),
  HomeModel(
      imagePath: 'assets/svg/cetagories.svg',
      title: "Cetagories",
      route: '/categories'),
  HomeModel(
      imagePath: 'assets/svg/customer.svg',
      title: "Customers",
      route: '/customers'),
  HomeModel(
      imagePath: 'assets/svg/reports.svg', title: "Reports", route: '/reports'),
  HomeModel(
      imagePath: 'assets/svg/coupons.svg', title: "Coupons", route: '/coupons'),
  HomeModel(imagePath: 'assets/svg/index.svg', title: "Inbox", route: '/inbox'),
  HomeModel(
      imagePath: 'assets/svg/knowlage.svg',
      title: "Knowlage Base",
      route: '/knowledgeBase'),
  HomeModel(
      imagePath: 'assets/svg/pupdates.svg',
      title: "Product Updates",
      route: '/productUpdates'),
  HomeModel(
      imagePath: 'assets/svg/person.svg',
      title: "Personal Settings",
      route: '/personalSettings'),
  HomeModel(
      imagePath: 'assets/svg/settings.svg',
      title: "Global Settings",
      route: '/globalSettings'),
];

final selectIndexProvider = StateProvider<int>((ref) => 0);
