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

          switch (i) {
            case 0:
              context.go('/beranda');
              break;
            case 1:
              context.go('/berita');
              break;
            case 2:
              context.go('/kontak');
              break;
            case 3:
              context.go('/profil');
              break;
          }
        },
      ),
    );
  }
}
