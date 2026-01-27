import 'package:flutter/material.dart';
import 'package:migran_id/common/widgets/modul/card_materi.dart';

class MateriView extends StatefulWidget {
  final int totalHalaman;
  final String judulBab;

  const MateriView({
    super.key,
    required this.totalHalaman,
    required this.judulBab,
  });

  @override
  State<MateriView> createState() => _MateriViewState();
}

class _MateriViewState extends State<MateriView> {
  int halamanSaatIni = 1; // mulai dari halaman 1

  void gantiHalaman(int halaman) {
    if (halaman >= 1 && halaman <= widget.totalHalaman) {
      setState(() {
        halamanSaatIni = halaman;
      });
    }
  }

  double get progressPersen => halamanSaatIni / widget.totalHalaman;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(title: Text(widget.judulBab)),
      body: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LinearProgressIndicator(value: progressPersen),
          ),
          Text('${(progressPersen * 100).toInt()}% selesai'),
          
          // // Konten halaman saat ini
          // Expanded(
          //   child: CardMateri(halaman: halamanSaatIni),
          // ),

          // Navigasi (contoh)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: halamanSaatIni > 1 
                    ? () => gantiHalaman(halamanSaatIni - 1) 
                    : null,
                child: Text('Sebelumnya'),
              ),
              ElevatedButton(
                onPressed: halamanSaatIni < widget.totalHalaman
                    ? () => gantiHalaman(halamanSaatIni + 1)
                    : null,
                child: Text('Selanjutnya'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}