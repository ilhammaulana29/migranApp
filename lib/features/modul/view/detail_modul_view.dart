// views/detail_modul_view.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:migran_id/common/widgets/modul/card_materi.dart';
import 'package:migran_id/common/widgets/modul/card_resource.dart';
import 'package:migran_id/common/widgets/modul/materi.dart';

const Color primaryColor = Color(0xFFE8D915);
const Color secondaryColor = Color(0xFFD35400);
const Color warmGray = Color(0xFF8B7D6B);
const Color lightBeige = Color(0xFFF8F5F0);
const Color seaColor = Color(0xFF2196F3);
const Color landColor = Color(0xFF4CAF50);


class DetailModulView extends StatefulWidget {
  final String modulTitle;
  
  const DetailModulView({
    super.key,
    required this.modulTitle,
  });

  @override
  State<DetailModulView> createState() => _DetailModulViewState();
}

class _DetailModulViewState extends State<DetailModulView> {
  int _activeTabIndex = 0; // 0: Materi, 1: Overview, 2: Resources
  List<Materi> _listMateri = [];

  @override
  void initState() {
    super.initState();
    _loadMateri();
  }

  void _loadMateri() {
    setState(() {
      _listMateri = [
        Materi(
          id: 1,
          title: 'Pengenalan OPP & Legalitas',
          description: 'Pahami dasar-dasar OPP dan regulasi yang berlaku',
          duration: '15 menit',
          isCompleted: true,
          isLocked: false,
          order: 1,
          videoUrl: 'https://example.com/video1',
        ),
        Materi(
          id: 2,
          title: 'Proses Rekrutmen OPP',
          description: 'Step-by-step cara daftar sampai seleksi',
          duration: '20 menit',
          isCompleted: true,
          isLocked: false,
          order: 2,
          pdfUrl: 'assets/pdfs/recruitment.pdf',
        ),
        Materi(
          id: 3,
          title: 'Interview Tips & Trik',
          description: 'Rahasia jawab pertanyaan interview dengan percaya diri',
          duration: '25 menit',
          isCompleted: false,
          isLocked: false,
          order: 3,
          videoUrl: 'https://example.com/video2',
        ),
        Materi(
          id: 4,
          title: 'Medical Checkup Guide',
          description: 'Persiapan medical checkup agar lolos',
          duration: '18 menit',
          isCompleted: false,
          isLocked: true,
          order: 4,
        ),
        Materi(
          id: 5,
          title: 'Negosiasi Kontrak Kerja',
          description: 'Cara dapatkan gaji dan benefit terbaik',
          duration: '30 menit',
          isCompleted: false,
          isLocked: true,
          order: 5,
        ),
      ];
    });
  }

  void _startMateri(Materi materi) {
    if (materi.isLocked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selesaikan materi sebelumnya dulu ya! 📚',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: secondaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    // Navigate to materi detail
    context.push('/materi/${materi.id}');
  }

  @override
  Widget build(BuildContext context) {
    final jumlahSelesai = _listMateri.where((m) => m.isCompleted).length;
    final jumlahTotal = _listMateri.length;
    final progress = jumlahTotal > 0 ? jumlahSelesai / jumlahTotal : 0;

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: secondaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Detail Modul',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: secondaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBeige,
                ),
                child: Icon(
                  Icons.bookmark_border_rounded,
                  color: secondaryColor,
                ),
              ),
              onPressed: () {
                // Bookmark functionality
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
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
                  // Module Type Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.school_rounded, size: 16, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          'SEA BASED MODULE',
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
                  
                  // Module Title
                  Text(
                    widget.modulTitle,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Module Stats
                  Row(
                    children: [
                      _buildStatItem(
                        icon: Icons.play_circle_filled_rounded,
                        value: '${_listMateri.length} Materi',
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      _buildStatItem(
                        icon: Icons.timer_rounded,
                        value: '2 Jam Total',
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      _buildStatItem(
                        icon: Icons.emoji_events_rounded,
                        value: 'Advanced',
                        color: Colors.white,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Progress Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress Belajar',
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
                                '${(progress * 100).toInt()}%',
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
                        
                        // Progress Bar
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: [
                              // Background container (full width, transparent atau warna background)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              // Progress bar yang mengisi dari kiri ke kanan
                              FractionallySizedBox(
                                widthFactor: progress.toDouble(),
                                alignment: Alignment.centerLeft, // Penting: mulai dari kiri
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
                          '$jumlahSelesai dari $jumlahTotal materi selesai',
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

            // TAB SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTabButton(
                        index: 0,
                        icon: Icons.menu_book_rounded,
                        label: 'Materi',
                      ),
                    ),
                    
                    Expanded(
                      child: _buildTabButton(
                        index: 1,
                        icon: Icons.info_outline_rounded,
                        label: 'Overview',
                      ),
                    ),
                    Expanded(
                      child: _buildTabButton(
                        index: 2,
                        icon: Icons.attach_file_rounded,
                        label: 'Resources',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CONTENT BASED ON SELECTED TAB
            _buildTabContent(),

            const SizedBox(height: 30),
          ],
        ),
      ),
      
   
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

Widget _buildTabButton({
  required int index,
  required IconData icon,
  required String label,
}) {
  final isActive = _activeTabIndex == index;
  return GestureDetector(
    onTap: () => setState(() => _activeTabIndex = index),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.0),
        borderRadius: BorderRadius.circular(10),
        border: isActive
            ? Border.all(color: secondaryColor.withOpacity(0.2), width: 1.5)
            : Border.all(color: Colors.transparent, width: 1.5),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: secondaryColor.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                  spreadRadius: 0.5,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Icon(
              icon,
              size: isActive ? 22 : 20,
              color: isActive ? secondaryColor : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              fontSize: isActive ? 13 : 12,
              fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
              color: isActive ? secondaryColor : Colors.grey.shade600,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildTabContent() {
    switch (_activeTabIndex) {
      case 0: // Materi
        return _buildDaftarMateri();
      case 1: // Overview
        return _buildOverviewContent();
      case 2: // Resources
        return _buildResourcesContent();
      default:
        return Container();
    }
  }

  Widget _buildDaftarMateri() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Materi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ikuti urutan materi untuk hasil terbaik',
            style: TextStyle(
              fontSize: 13,
              color: warmGray,
            ),
          ),
          const SizedBox(height: 20),
          
          // GUNAKAN CARD MATERI
          ...List.generate(_listMateri.length, (index) {
            final materi = _listMateri[index];
            return CardMateri(
              materi: materi,
              index: index,
              onTap: () => _startMateri(materi),
            );
          }),
          
          const SizedBox(height: 20),
          
          // Completion CTA
          if (_listMateri.isNotEmpty && _listMateri.every((m) => m.isCompleted))
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.9),
                    secondaryColor.withOpacity(0.8),
                ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.celebration_rounded, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yeay! Modul Selesai 🎉',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Klaim sertifikat dan lanjut ke modul berikutnya!',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    onPressed: () {
                      // Navigate to certificate
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOverviewContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang Modul',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 20),
          
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apa yang akan kamu pelajari?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                ...List.generate(4, (index) => _buildLearningPoint(index)),
                const SizedBox(height: 20),
                Text(
                  'Untuk siapa modul ini?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildAudienceChip('Calon Tenaga Kerja OPP'),
                    _buildAudienceChip('Fresh Graduate'),
                    _buildAudienceChip('Mau Ganti Karir'),
                    _buildAudienceChip('Butuh Skill Baru'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPoint(int index) {
    final points = [
      'Pahami semua regulasi dan legalitas OPP',
      'Kuasi tips interview dan seleksi administrasi',
      'Pelajari strategi negosiasi kontrak kerja',
      'Siapkan medical checkup dengan benar',
    ];
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_rounded, size: 18, color: landColor), // Menggunakan landColor
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              points[index],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudienceChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildResourcesContent() {
    final resources = [
      {'type': 'PDF', 'name': 'Panduan Lengkap OPP 2024', 'size': '2.4 MB'},
      {'type': 'PDF', 'name': 'Contoh CV & Surat Lamaran', 'size': '1.8 MB'},
      {'type': 'Video', 'name': 'Interview Simulation', 'duration': '15:30'},
      {'type': 'Link', 'name': 'Website Resmi BP2MI', 'url': 'https://bp2mi.go.id'},
    ];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Downloadable Resources',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: secondaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Download materi pendukung untuk belajar offline',
            style: TextStyle(
              fontSize: 13,
              color: warmGray,
            ),
          ),
          const SizedBox(height: 20),
          
          // GUNAKAN CARD RESOURCE
          ...List.generate(resources.length, (index) {
            final resource = resources[index];
            return CardResource(
              resource: resource,
              onDownload: () {
                // Handle download or open link
                print('Download ${resource['name']}');
              },
            );
          }),
        ],
      ),
    );
  }
}