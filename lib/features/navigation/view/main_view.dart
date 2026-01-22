import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:migran_id/common/widgets/bottom_navbar.dart';

import '../logic/navigation_provider.dart';

class MainView extends ConsumerWidget {
  final Widget child;
  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavProvider);

return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavbar(
        currentIndex: index,
        onTap: (i) {
          ref.read(bottomNavProvider.notifier).state = i;

          if (i == 0) context.go('/home');
          if (i == 1) context.go('/contact');
          if (i == 2) context.go('/profile');
        },
      ),
    );

  }
}
