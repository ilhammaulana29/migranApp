import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:migran_id/common/widgets/modul/card_modul.dart';
import 'package:migran_id/common/widgets/modul/modul.dart';

const Color primaryColor = Color(0xFFE8D915);
const Color secondaryColor = Color(0xFFD35400);
const Color warmGray = Color(0xFF8B7D6B);
const Color lightBeige = Color(0xFFF8F5F0);
const Color seaColor = Color(0xFF2196F3);
const Color landColor = Color(0xFF4CAF50);

class ModulView extends StatefulWidget {
  const ModulView({super.key});

  @override
  State<ModulView> createState() => _ModulViewState();
}

class _ModulViewState extends State<ModulView> {
  int _activeCategoryIndex = 0;

  final List<Module> seaModules = [
    Module(
      id: 1,
      title: 'Dasar-dasar OPP',
      description: 'Pelajari semua tentang OPP resmi dan legalitasnya',
      duration: '45 menit',
      difficulty: 'Pemula',
      progress: 80,
      icon: Icons.water_drop,
      imageUrl: 'assets/images/modul-sea-1.jpg',
      lessons: 5,
    ),
    Module(
      id: 2,
      title: 'Tips Interview OPP',
      description: 'Rahasia lolos interview dan seleksi OPP',
      duration: '1 jam',
      difficulty: 'Menengah',
      progress: 45,
      icon: Icons.eco,
      imageUrl: 'assets/images/modul-sea-2.jpg',
      lessons: 8,
    ),
    Module(
      id: 3,
      title: 'Negosiasi Kontrak',
      description: 'Cara dapatkan kontrak kerja terbaik untukmu',
      duration: '1.5 jam',
      difficulty: 'Advanced',
      progress: 30,
      icon: Icons.sailing,
      imageUrl: 'assets/images/modul-sea-3.jpg',
      lessons: 6,
    ),
  ];

  final List<Module> landModules = [
    Module(
      id: 4,
      title: 'Safety First!',
      description: 'Jaga keselamatan kerja dengan tips praktis',
      duration: '1 jam',
      difficulty: 'Pemula',
      progress: 90,
      icon: Icons.park,
      imageUrl: 'assets/images/modul-land-1.jpg',
      lessons: 7,
    ),
    Module(
      id: 5,
      title: 'Dokumen Anti Ribet',
      description: 'Bikin dokumen lengkap tanpa pusing',
      duration: '1.5 jam',
      difficulty: 'Menengah',
      progress: 60,
      icon: Icons.terrain,
      imageUrl: 'assets/images/modul-land-2.jpg',
      lessons: 9,
    ),
    Module(
      id: 6,
      title: 'Health Check Guide',
      description: 'Persiapan medical checkup yang oke',
      duration: '45 menit',
      difficulty: 'Pemula',
      progress: 20,
      icon: Icons.forest,
      imageUrl: 'assets/images/modul-land-3.jpg',
      lessons: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: secondaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Modul Pembelajaran',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: secondaryColor,
          ),
        ),
        centerTitle: true,
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
                  onPressed: () {
                  },
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO SECTION - Gen Z Style
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.9),
                    secondaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge Gen Z
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flash_on_rounded, size: 16, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          'LEARN & EARN!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Title dengan style Gen Z
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Level Up ',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'Skills Mu!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.2,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Subtitle ala Gen Z
                  Text(
                    'Gas pol belajar modul, biar makin jago dan siap kerja di luar negeri! 💪',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.95),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Progress Section - Updated dari kiri ke kanan
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress Kamu',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '65%',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        
                        // Progress bar dari kiri ke kanan
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              // Background
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              // Progress fill dari kiri ke kanan
                              FractionallySizedBox(
                                widthFactor: 0.65,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0.8),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Suswanto, terus gaskeun belajarnya! 🚀',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Row(
                    children: [
                      Text(
                        'Daftar Modul',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: secondaryColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Category Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildCategoryCard(
                          title: 'Sea Based',
                          subtitle: 'Modul untuk sektor kelautan & perikanan',
                          icon: Icons.waves_rounded,
                          isActive: _activeCategoryIndex == 0,
                          color: seaColor,
                          count: seaModules.length,
                          onTap: () => setState(() => _activeCategoryIndex = 0),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildCategoryCard(
                          title: 'Land Based',
                          subtitle: 'Modul untuk sektor perkebunan & konstruksi',
                          icon: Icons.park,
                          isActive: _activeCategoryIndex == 1,
                          color: landColor,
                          count: landModules.length,
                          onTap: () => setState(() => _activeCategoryIndex = 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // MODULE LIST SECTION
            Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 25,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header dengan count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _activeCategoryIndex == 0 
                                ? 'Sea Based Modul' 
                                : 'Land Based Modul',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: secondaryColor,
                            ),
                          ),
                          Text(
                            '${(_activeCategoryIndex == 0 ? seaModules : landModules).length} modul seru tersedia',
                            style: TextStyle(
                              fontSize: 13,
                              color: warmGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Module List
                  ...List.generate(
                    (_activeCategoryIndex == 0 ? seaModules : landModules).length,
                    (index) {
                      //Ambil modul
                      final module = (_activeCategoryIndex == 0 ? seaModules : landModules)[index];
                      
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ModuleCard(
                          module: module,
                          onPressed: () {
                            final judulEncoded = Uri.encodeComponent(module.title);
                            context.push('/modul/${module.id}?judul=$judulEncoded&id=${module.id}');
                          },
                        ),
                      );
                    },
                  ),
                  
                  // CTA Bottom
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: lightBeige,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.tips_and_updates_rounded, color: primaryColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Selesaikan semua modul buat dapetin badge eksklusif! 🏆',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isActive,
    required Color color,
    required int count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isActive ? color.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? color : Colors.grey.shade200,
            width: isActive ? 2 : 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withOpacity(isActive ? 0.2 : 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$count Modules',
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            if (isActive) ...[
              Row(
                children: [
                  Icon(Icons.arrow_forward_rounded, size: 16, color: color),
                  const SizedBox(width: 6),
                  Text(
                    'Active',
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}