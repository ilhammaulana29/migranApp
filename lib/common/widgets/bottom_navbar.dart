import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE8D915);
    const Color secondaryColor = Color(0xFFD35400);
    const Color warmGray = Color(0xFF8B7D6B);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: secondaryColor,
          unselectedItemColor: warmGray,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _navIcon(
                icon: Icons.home_rounded,
                active: currentIndex == 0,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                warmGray: warmGray,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: _navIcon(
                icon: Icons.newspaper_rounded,
                active: currentIndex == 1,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                warmGray: warmGray,
              ),
              label: 'Berita',
            ),
            BottomNavigationBarItem(
              icon: _navIcon(
                icon: Icons.phone_in_talk_rounded,
                active: currentIndex == 2,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                warmGray: warmGray,
              ),
              label: 'Kontak',
            ),
            BottomNavigationBarItem(
              icon: _navIcon(
                icon: Icons.person_rounded,
                active: currentIndex == 3,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                warmGray: warmGray,
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon({
    required IconData icon,
    required bool active,
    required Color primaryColor,
    required Color secondaryColor,
    required Color warmGray,
  }) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? primaryColor.withOpacity(0.15) : Colors.transparent,
          ),
          child: Icon(
            icon,
            size: active ? 20 : 22,
            color: active ? secondaryColor : warmGray,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 3),
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFD35400),
            ),
          ),
      ],
    );
  }
}
