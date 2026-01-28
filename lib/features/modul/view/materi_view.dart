import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color primaryColor = Color(0xFFE8D915);
const Color secondaryColor = Color(0xFFD35400);
const Color warmGray = Color(0xFF8B7D6B);
const Color lightBeige = Color(0xFFF8F5F0);
const Color seaColor = Color(0xFF2196F3);
const Color landColor = Color(0xFF4CAF50);

class MateriView extends StatefulWidget {
  final int totalHalaman;
  final String judulBab;
  final String? modulType; // Optional: bisa SEA BASED atau LAND BASED

  const MateriView({
    super.key,
    required this.totalHalaman,
    required this.judulBab,
    this.modulType,
  });

  @override
  State<MateriView> createState() => _MateriViewState();
}

class _MateriViewState extends State<MateriView> {
  int halamanSaatIni = 1; // mulai dari halaman 1
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void gantiHalaman(int halaman) {
    if (halaman >= 1 && halaman <= widget.totalHalaman) {
      setState(() {
        halamanSaatIni = halaman;
      });
      _pageController?.animateToPage(
        halaman - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  double get progressPersen => halamanSaatIni / widget.totalHalaman;

  Color _getTypeColor() {
    if (widget.modulType?.contains('SEA') == true) {
      return seaColor;
    } else if (widget.modulType?.contains('LAND') == true) {
      return landColor;
    }
    return secondaryColor;
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
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
                  color: Colors.grey.shade700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getTypeColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${(progressPersen * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _getTypeColor(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Main Progress Bar
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progressPersen,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getTypeColor(),
                          _getTypeColor().withOpacity(0.8),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Halaman $halamanSaatIni dari ${widget.totalHalaman}',
          //       style: TextStyle(
          //         fontSize: 13,
          //         color: Colors.grey.shade600,
          //       ),
          //     ),
          //     Text(
          //       '${(progressPersen * 100).toInt()}% selesai',
          //       style: TextStyle(
          //         fontSize: 13,
          //         fontWeight: FontWeight.w600,
          //         color: _getTypeColor(),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildMateriContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Halaman indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getTypeColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Halaman $halamanSaatIni',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: _getTypeColor(),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Judul Halaman
          Text(
            '${widget.judulBab} - Bagian $halamanSaatIni',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Konten Materi (contoh)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getSampleContent(halamanSaatIni),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Tips Section (jika ada)
                  if (halamanSaatIni == 3 || halamanSaatIni == 5)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: primaryColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_rounded,
                            color: secondaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Tips Penting: Pastikan semua dokumen sudah dipersiapkan sebelum interview.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  const SizedBox(height: 20),
                  
                  // Image placeholder
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=400&h=200&fit=crop'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ilustrasi: Proses Interview',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Sumber: Unsplash',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getSampleContent(int page) {
    final contents = [
      'Pekerja migran adalah warga negara Indonesia yang akan, sedang, atau telah melakukan pekerjaan di luar negeri. Pemerintah Indonesia melalui Badan Pelindungan Pekerja Migran Indonesia (BP2MI) memiliki program One Placement Policy (OPP) untuk melindungi hak-hak pekerja migran.',
      'Program OPP bertujuan untuk meningkatkan kualitas penempatan dan perlindungan pekerja migran Indonesia. Melalui OPP, pemerintah menjamin proses rekrutmen yang transparan, pengawasan yang ketat, dan perlindungan hukum yang komprehensif.',
      'Untuk mengikuti program OPP, calon pekerja migran harus memenuhi persyaratan tertentu seperti usia minimal 18 tahun, sehat jasmani dan rohani, memiliki dokumen lengkap (KTP, KK, Akta Kelahiran), serta melalui proses seleksi yang ketat.',
      'Interview adalah tahap kritis dalam proses seleksi OPP. Persiapan yang matang sangat diperlukan, termasuk memahami pertanyaan umum, mempersiapkan jawaban, serta menjaga penampilan dan sikap yang profesional.',
      'Setelah lolos seleksi, pekerja migran akan menjalani medical checkup untuk memastikan kondisi kesehatan yang optimal. Pemeriksaan meliputi tes fisik, laboratorium, dan psikologis untuk menyesuaikan dengan jenis pekerjaan.',
      'Negosiasi kontrak kerja merupakan hak setiap pekerja migran. Pahami klausul-klausul penting seperti gaji, jam kerja, hak cuti, asuransi, dan perlindungan hukum sebelum menandatangani kontrak.',
    ];
    
    return contents[(page - 1) % contents.length] * 3; // Panjangkan konten
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tombol Sebelumnya
          Expanded(
            child: OutlinedButton(
              onPressed: halamanSaatIni > 1 
                  ? () => gantiHalaman(halamanSaatIni - 1) 
                  : null,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: halamanSaatIni > 1 ? _getTypeColor() : Colors.grey.shade300,
                ),
                backgroundColor: halamanSaatIni > 1 ? _getTypeColor().withOpacity(0.05) : Colors.grey.shade50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    size: 18,
                    color: halamanSaatIni > 1 ? _getTypeColor() : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sebelumnya',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: halamanSaatIni > 1 ? _getTypeColor() : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Indikator Halaman
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$halamanSaatIni / ${widget.totalHalaman}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Tombol Selanjutnya / Selesai
          Expanded(
            child: ElevatedButton(
              onPressed: halamanSaatIni < widget.totalHalaman
                  ? () => gantiHalaman(halamanSaatIni + 1)
                  : () {
                      // Navigasi ke completion screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Selamat! Anda telah menyelesaikan materi ini 🎉',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          backgroundColor: _getTypeColor(),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                      context.pop();
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: _getTypeColor(),
                foregroundColor: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    halamanSaatIni < widget.totalHalaman ? 'Selanjutnya' : 'Selesai',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    halamanSaatIni < widget.totalHalaman 
                        ? Icons.arrow_forward_rounded 
                        : Icons.check_circle_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          widget.judulBab,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.grey.shade800,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        actions: [
          IconButton(
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
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightBeige,
              ),
              child: Icon(
                Icons.share_rounded,
                color: secondaryColor,
              ),
            ),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Section
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: _buildProgressIndicator(),
          ),
          
          // Materi Content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.totalHalaman,
              onPageChanged: (index) {
                setState(() {
                  halamanSaatIni = index + 1;
                });
              },
              itemBuilder: (context, index) {
                return _buildMateriContent();
              },
            ),
          ),
          
          // Navigation Buttons
          _buildNavigationButtons(),
        ],
      ),
    );
  }
}