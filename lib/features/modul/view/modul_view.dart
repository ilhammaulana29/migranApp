import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migran_id/common/widgets/modul/card_modul.dart';
import 'package:migran_id/common/widgets/modul/modul.dart';

const Color kPrimary = Color(0xFFCBA648);
const Color kSeaColor = Color(0xFF2196F3);
const Color kLandColor = Color(0xFF4CAF50);

class ModulView extends StatefulWidget {
  const ModulView({super.key});

  @override
  State<ModulView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ModulView> {
  int _activeCategoryIndex = 0;

  final List<Module> seaModules = [
    Module(
      id: 1,
      title: 'Marine Biology Basics',
      description: 'Introduction to marine organisms and ecosystems',
      duration: '2 hours',
      difficulty: 'Beginner',
      progress: 80,
      icon: Icons.water_drop,
      imageUrl: 'https://picsum.photos/400/250?random=1',
      lessons: 8,
    ),
    Module(
      id: 2,
      title: 'Ocean Conservation',
      description: 'Learn about protecting marine environments',
      duration: '3 hours',
      difficulty: 'Intermediate',
      progress: 45,
      icon: Icons.eco,
      imageUrl: 'https://picsum.photos/400/250?random=2',
      lessons: 12,
    ),
  ];

  final List<Module> landModules = [
    Module(
      id: 3,
      title: 'Forest Ecosystems',
      description: 'Understanding forest biodiversity and conservation',
      duration: '2.5 hours',
      difficulty: 'Beginner',
      progress: 90,
      icon: Icons.park,
      imageUrl: 'https://picsum.photos/400/250?random=3',
      lessons: 9,
    ),
    Module(
      id: 4,
      title: 'Mountain Geology',
      description: 'Study of mountain formation and rock types',
      duration: '3 hours',
      difficulty: 'Intermediate',
      progress: 30,
      icon: Icons.terrain,
      imageUrl: 'https://picsum.photos/400/250?random=4',
      lessons: 11,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: kPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.school, color: Colors.white),
            ),
            const SizedBox(width: 12),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [kPrimary, Color(0xFFEAE36B)],
                ).createShader(bounds);
              },
              child: Text(
                'LearnHub',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kPrimary, Color(0xFFEBC56E), Color(0xFFEAE36B)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Alex! 👋',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Continue your learning journey...',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white38,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: 0.65,
                      backgroundColor: Colors.white38,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Category Tabs
              Row(
                children: [
                  Expanded(
                    child: _buildCategoryTab(
                      title: 'Sea Based',
                      subtitle: 'Explore marine ecosystems...',
                      icon: Icons.water_drop,
                      isActive: _activeCategoryIndex == 0,
                      color: kSeaColor,
                      onTap: () => setState(() => _activeCategoryIndex = 0),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildCategoryTab(
                      title: 'Land Based',
                      subtitle: 'Discover terrestrial ecosystems...',
                      icon: Icons.park,
                      isActive: _activeCategoryIndex == 1,
                      color: kLandColor,
                      onTap: () => setState(() => _activeCategoryIndex = 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Modules
              Text(
                _activeCategoryIndex == 0 ? 'Sea Based Modules' : 'Land Based Modules',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [kPrimary, Color(0xFFEAE36B)],
                    ).createShader(const Rect.fromLTWH(0, 0, 300, 20)),
                ),
              ),
              const SizedBox(height: 16),

              // Module List
              ...List.generate(
                (_activeCategoryIndex == 0 ? seaModules : landModules).length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ModuleCard(
                    module: (_activeCategoryIndex == 0 ? seaModules : landModules)[index],
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Opening ${(_activeCategoryIndex == 0 ? seaModules : landModules)[index].title}')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isActive,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? kPrimary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '12 Modules',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}