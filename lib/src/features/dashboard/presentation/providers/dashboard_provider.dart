import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DashboardNotifier = NotifierProvider<DashboardProvider, void>;

final dashboard_provider = DashboardNotifier(DashboardProvider.new);

class DashboardProvider extends Notifier<void> {
  @override
  void build() {}
}
