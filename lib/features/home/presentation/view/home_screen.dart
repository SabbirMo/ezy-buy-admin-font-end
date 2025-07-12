import 'package:ezy_buy_admin_font_end/features/home/presentation/provider/home_provider.dart';
import 'package:ezy_buy_admin_font_end/features/home/presentation/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(selectIndexProvider);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 230,
                  color: Color(0xff1E2753),
                  padding: EdgeInsets.only(top: 25),
                  child: ListView.builder(
                    itemCount: cetagories.length,
                    itemBuilder: (context, index) {
                      final item = cetagories[index];
                      final isSelected = index == currentIndex;
                      return InkWell(
                        onTap: () {
                          ref.read(selectIndexProvider.notifier).state = index;
                          context.go(item.route);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                item.imagePath,
                                colorFilter: ColorFilter.mode(
                                    isSelected
                                        ? Color(0xff5A607F)
                                        : Colors.white,
                                    BlendMode.srcIn),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: isSelected
                                      ? Color(0xff5A607F)
                                      : Colors.white,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
