import 'package:flutter/material.dart';

class AnalisisPage extends StatelessWidget {
  const AnalisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisis Desain UX"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Soal Quiz 5
              Text(
                "SOAL QUIZ 5 — ANALISIS DESAIN UX:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                "Tuliskan analisis UX dari desain dashboard yang telah dibuat (Quiz 4), "
                "dengan menjawab tiga pertanyaan berikut:\n"
                "1. Apa nilai User Experience (UX) terbaik dari desain Anda?\n"
                "2. Bagian mana yang masih bisa ditingkatkan (misal: spacing, warna, keterbacaan)?\n"
                "3. Sebutkan prinsip Material Design yang diterapkan.",
              ),
              SizedBox(height: 12),

              // Jawaban Analisis
              Text(
                "1️. Nilai UX terbaik:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                "• Hierarki visual jelas: Dashboard dibagi menjadi tiga bagian utama: Grid kategori di atas, Card profil di tengah, dan daftar aktivitas di bawah. Pengguna mudah melihat prioritas informasi.\n"
                "• Feedback interaksi: Setiap elemen interaktif (Grid kategori, Card profil, List aktivitas) memiliki efek ripple/gesture dan menampilkan dialog atau aksi saat ditekan, memberikan umpan balik langsung.\n"
                "• Mode terang & gelap: Pengguna dapat men-toggle tema, sehingga nyaman digunakan dalam berbagai kondisi cahaya.\n"
                "• Konsistensi ikon dan warna: Warna biru utama dipakai untuk ikon/aksi, status online hijau, teks dan background kontras, sehingga navigasi intuitif.\n"
                "• Responsif dan proporsional: Layout menggunakan Column + Expanded, sehingga elemen menyesuaikan ruang dengan baik tanpa tumpang tindih.",
              ),
              SizedBox(height: 12),

              Text(
                "2️. Bagian yang bisa ditingkatkan:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                "• Spacing & jarak antar elemen: Card profil dan List aktivitas bisa diberi jarak lebih untuk kesan lebih lega.\n"
                "• Keterbacaan teks kecil: Subtitle “Ketuk untuk Detail” dan waktu aktivitas menggunakan font kecil, mungkin sulit dibaca di perangkat dengan layar kecil.\n"
                "• Indikator status lebih menonjol: Status online/offline di avatar terlalu kecil, bisa dibuat lebih besar atau menggunakan animasi ringan.\n"
                "• Scrollbar atau pagination: List aktivitas jika panjang akan perlu scrollbar atau pagination agar tetap mudah dinavigasi.",
              ),
              SizedBox(height: 12),

              Text(
                "3️. Prinsip Material Design yang diterapkan:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                "• Hierarchy: Penggunaan Column + Expanded dan ukuran Card yang berbeda menciptakan prioritas visual.\n"
                "• Consistency: Warna, ikon, dan tipografi konsisten di seluruh dashboard.\n"
                "• Feedback: Ripple effect pada InkWell dan dialog saat ditekan memberikan feedback langsung.\n"
                "• Responsiveness: Layout fleksibel menyesuaikan ruang yang tersedia, baik di layar besar maupun kecil.\n"
                "• Elevation & Shadow: Card memiliki shadow/elevation untuk menciptakan kedalaman visual dan memisahkan elemen.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}