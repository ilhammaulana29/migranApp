import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:migran_id/common/widgets/app_bar.dart';
import 'package:migran_id/common/widgets/home/card_layanan.dart';
import 'package:migran_id/common/widgets/home/long_card_layanan.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Palette warna hangat/oranye
    const Color primaryColor = Color(0xFFE8D915); // Kuning emas utama
    const Color secondaryColor = Color(0xFFD35400); // Oranye tua
    const Color accentColor = Color(0xFF27AE60); // Hijau
    const Color warmGray = Color(0xFF8B7D6B); // Abu-abu hangat
    const Color lightBeige = Color(0xFFF8F5F0); // Krem terang untuk background

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: const MigranAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO SECTION DENGAN BACKGROUND
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.9),
                    secondaryColor.withOpacity(0.8),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'INFORMASI MIGRASI',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Layanan Lengkap\nUntuk Calon PMI',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Akses panduan lengkap dan persiapan berkas untuk bekerja di luar negeri',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Card Layanan Informasi Utama
                    LongCardLayanan(
                      image: 'assets/images/opp-icon.png',
                      title: 'Panduan Lengkap Penempatan PMI',
                      description:
                          'Pelajari prosedur resmi dan tahapan menjadi PMI',
                      accentColor: accentColor,
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    LongCardLayanan(
                      image: 'assets/images/logo.jpeg',
                      title: 'Hak dan Kewajiban Pekerja Migran',
                      description:
                          'Pahami hak Anda sebelum bekerja di luar negeri',
                      accentColor: secondaryColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // CTA SECTION - PERSIAPAN BERKAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, lightBeige],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.checklist_rounded,
                            color: secondaryColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Persiapan Berkas',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Dokumen apa saja yang diperlukan untuk menjadi PMI?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Persiapkan berkas-berkas penting sesuai dengan ketentuan resmi',
                      style: TextStyle(fontSize: 13, color: warmGray),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        elevation: 0,
                        shadowColor: primaryColor.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Lihat Daftar Berkas',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // LAYANAN LAINNYA SECTION
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Layanan Lainnya',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: lightBeige,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      '6 Layanan',
                      style: TextStyle(
                        fontSize: 11,
                        color: warmGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // GRID LAYANAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.85,
                children: [
                  
                  CardLayanan(
                    icon: Icons.business_center_rounded,
                    title: 'Informasi\nOPP',
                    color: primaryColor,
                    onTap:(){
                      context.push('/modul');
                    },
                  ),
                  CardLayanan(
                    icon: Icons.health_and_safety_rounded,
                    title: 'Keselamatan\nKerja',
                    color: secondaryColor,
                  ),
                  CardLayanan(
                    icon: Icons.description_rounded,
                    title: 'Legal\nDokumen',
                    color: accentColor,
                  ),
                  CardLayanan(
                    icon: Icons.medical_services_rounded,
                    title: 'Layanan\nKesehatan',
                    color: Color(0xFFE74C3C),
                  ),
                  CardLayanan(
                    icon: Icons.support_agent_rounded,
                    title: 'Konsultasi\nOnline',
                    color: Color(0xFF9B59B6),
                  ),
                  CardLayanan(
                    icon: Icons.help_center_rounded,
                    title: 'FAQ &\nBantuan',
                    color: warmGray,
                  ),
                ],
              ),
            ),

            // FOOTER SPACE
            const SizedBox(height: 30),
            Container(
              height: 4,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
