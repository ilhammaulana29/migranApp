import 'package:go_router/go_router.dart';
import 'package:migran_id/features/modul/view/modul_view.dart';
import 'package:migran_id/features/modul/view/detail_modul_view.dart';
import 'package:migran_id/features/modul/view/materi_view.dart';
import 'package:migran_id/features/news/view/news_view.dart';
import '../../features/navigation/view/main_view.dart';
import '../../features/home/view/home_view.dart';
import '../../features/contact/view/contact_view.dart';
import '../../features/profile/view/profile_view.dart';

final router = GoRouter(
  initialLocation: '/beranda',
  routes: [
    // Modul
    GoRoute(path: '/modul',
    builder: (context, state) => const ModulView(),
    ),

    GoRoute(path: '/modul/:id',
      builder: (context,state){
        final judul = state.uri.queryParameters['judul']!;
        final id = state.uri.queryParameters['id']!;

        return DetailModulView(
          modulTitle : judul,
          modulId: id,
        );
      },
    ),

    GoRoute(
      path: '/modul/:id/:materiid',
      builder: (context, state) {
        final judul = state.uri.queryParameters['judul']!;
        final halaman = int.tryParse(state.uri.queryParameters['halaman'] ?? '1') ?? 1;

        return MateriView(
          judulBab: judul,
          totalHalaman: halaman,
        );
      },
    ),

    // DENGAN Bottom Navigation
    ShellRoute(
      builder: (context, state, child) {
        return MainView(child: child);
      },
      routes: [
        GoRoute(
          path: '/beranda',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(path: '/berita', builder: (context, state) => const NewsView()),
        GoRoute(
          path: '/kontak',
          builder: (context, state) => const ContactView(),
        ),
        GoRoute(
          path: '/profil',
          builder: (context, state) => const ProfileView(),
        ),
      ],
    ),
  ],
);
