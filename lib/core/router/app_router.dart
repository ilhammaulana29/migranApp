import 'package:go_router/go_router.dart';
import '../../features/navigation/view/main_view.dart';
import '../../features/home/view/home_view.dart';
import '../../features/contact/view/contact_view.dart';
import '../../features/profile/view/profile_view.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    // DENGAN Bottom Navigation
    ShellRoute(
      builder: (context, state, child) {
        return MainView(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeView()),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactView(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileView(),
        ),
      ],
    ),
  ],
);
