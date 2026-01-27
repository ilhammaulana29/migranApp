import 'package:flutter/material.dart';
import 'package:migran_id/common/widgets/app_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    // Palette warna MigranID
    const Color primaryColor = Color(0xFFE8D915);
    const Color secondaryColor = Color(0xFFD35400);
    const Color accentColor = Color(0xFF27AE60);
    const Color warmGray = Color(0xFF8B7D6B);
    const Color lightBeige = Color(0xFFF8F5F0);

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: const MigranAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HERO PROFILE =================
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 260),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.9),
                    secondaryColor.withOpacity(0.85),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/bg-kp2mi.png'),
                  fit: BoxFit.cover,
                  opacity: 0.15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(  
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage(
                          'assets/images/foto-profil.png',
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Nama
                    const Text(
                      'AMANDA LESTARI PUTRI',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Email / Role
                    Text(
                      'amandalestari19@gmail.com',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= MENU SECTION =================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengaturan Akun',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _menuTile(
                    icon: Icons.person_rounded,
                    title: 'Ubah Akun',
                    subtitle: 'Edit data akun dan profil',
                    color: primaryColor,
                    onTap: () {},
                  ),
                  _menuTile(
                    icon: Icons.notifications_rounded,
                    title: 'Notifikasi',
                    subtitle: 'Atur preferensi notifikasi',
                    color: accentColor,
                    onTap: () {},
                  ),
                  _menuTile(
                    icon: Icons.description_rounded,
                    title: 'Syarat & Ketentuan',
                    subtitle: 'Ketentuan penggunaan aplikasi',
                    color: secondaryColor,
                    onTap: () {},
                  ),
                  _menuTile(
                    icon: Icons.privacy_tip_rounded,
                    title: 'Kebijakan Privasi',
                    subtitle: 'Perlindungan data pengguna',
                    color: const Color(0xFF2980B9),
                    onTap: () {},
                  ),
                  _menuTile(
                    icon: Icons.info_rounded,
                    title: 'Tentang Aplikasi',
                    subtitle: 'Informasi versi dan pengembang',
                    color: warmGray,
                    onTap: () {},
                  ),

                  const SizedBox(height: 10),

                  // ================= LOGOUT =================
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // logout logic
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.red.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.logout_rounded,
                            color: Colors.red,
                            size: 22,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Keluar',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= MENU TILE COMPONENT =================
  Widget _menuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8B7D6B),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Color(0xFF8B7D6B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
