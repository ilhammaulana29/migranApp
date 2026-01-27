import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:migran_id/common/widgets/app_bar.dart';
import '../model/contact_model.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE8D915);
    const Color secondaryColor = Color(0xFFD35400);
    const Color warmGray = Color(0xFF8B7D6B);
    const Color lightBeige = Color(0xFFF8F5F0);

    final List<ContactModel> contactList = [
      ContactModel(
        id: 'bp3mi',
        title: 'BP3MI / P4MI',
        description: 'Balai Pelayanan & Perlindungan PMI',
        icon: Icons.account_balance_rounded,
        color: secondaryColor,
        content: 'Detail BP3MI',
      ),
      ContactModel(
        id: 'p3mi',
        title: 'P3MI',
        description: 'Perusahaan Penempatan PMI',
        icon: Icons.business_center_rounded,
        color: primaryColor,
        content: 'Detail P3MI',
      ),
      ContactModel(
        id: 'lsp',
        title: 'LSP',
        description: 'Lembaga Sertifikasi Profesi',
        icon: Icons.verified_rounded,
        color: Color(0xFF27AE60),
        content: 'Detail LSP',
      ),
      ContactModel(
        id: 'sarkes',
        title: 'SARKES',
        description: 'Sarana Kesehatan PMI',
        icon: Icons.local_hospital_rounded,
        color: Color(0xFFE74C3C),
        content: 'Detail SARKES',
      ),
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: const MigranAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HERO SECTION =================
            Container(
              width: double.infinity,
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
                      child: const Text(
                        'KONTAK RESMI',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Informasi &\nLayanan PMI',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hubungi lembaga resmi untuk mendapatkan informasi yang akurat dan terpercaya',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= TEKS PEMBUKA =================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar Layanan Kontak',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Pilih lembaga sesuai kebutuhan Anda untuk mendapatkan layanan dan pendampingan',
                    style: TextStyle(fontSize: 13, color: warmGray),
                  ),
                ],
              ),
            ),

            // ================= LIST KONTAK (ISI TETAP) =================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contactList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = contactList[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      context.push('/Contact/${item.id}', extra: item);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: item.color.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(item.icon, color: item.color, size: 26),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: warmGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: warmGray,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
