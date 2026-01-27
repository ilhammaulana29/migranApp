import 'package:flutter/material.dart';

class MigranAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;

  const MigranAppBar({super.key, this.showBack = false});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE8D915);
    const Color secondaryColor = Color(0xFFD35400);
    const Color warmGray = Color(0xFF8B7D6B);
    const Color lightBeige = Color(0xFFF8F5F0);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: secondaryColor,
              onPressed: () => Navigator.pop(context),
            )
          : null,
      titleSpacing: showBack ? 0 : 16,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/logo.jpeg', height: 34),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MigranID',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: secondaryColor,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                'Solusi Migrasi Terpercaya',
                style: TextStyle(fontSize: 10, color: warmGray),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: Stack(
            children: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBeige,
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: secondaryColor,
                  ),
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
