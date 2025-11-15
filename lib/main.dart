import 'package:flutter/material.dart';

// 📌 Import folder latihan_quiz_flutter (Quiz 1–5)
import './latihan_quiz_flutter/quiz1_grid_produk.dart';
import './latihan_quiz_flutter/quiz2_kartu_profil.dart';
import './latihan_quiz_flutter/quiz3_kontak.dart';
import './latihan_quiz_flutter/quiz4_kombinasi.dart';
import './latihan_quiz_flutter/quiz5_analisis.dart';

// 📌 Import tugas lama
import './tugas_baru.dart';
import './cookingPortfolioPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard_Tugas_Pemrograman_Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainMenuScreen(),

      // 📌 Semua routes aplikasi
      routes: {
        // ===== Menu Tugas Lama =====
        '/tugas_baru': (_) => const TugasBaru(),
        '/portfolio': (_) => const CookingPortfolioPage(),

        // ===== Menu Quiz Flutter =====
        '/quiz1': (_) => const GridProdukPage(),
        '/quiz2': (_) => const Quiz2KartuProfil(),
        '/quiz3': (_) => const Quiz3Wrapper(),
        '/quiz4': (_) => const Quiz4Wrapper(),
        '/quiz5': (_) => const AnalisisPage(),
      },
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama Tugas Flutter'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ===== MENU TUGAS LAMA =====
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/tugas_baru'),
            child: const Text('Lihat Tugas Baru (Profil Mahasiswa)'),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/portfolio'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            child: const Text(
              'Lihat Cooking Portfolio',
              style: TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(height: 40),
          const Divider(thickness: 1),
          const SizedBox(height: 10),

          const Text(
            "Latihan Quiz Flutter",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ===== MENU QUIZ =====
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/quiz1'),
            child: const Text('Quiz 1 — Grid Produk'),
          ),
          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/quiz2'),
            child: const Text('Quiz 2 — Kartu Profil Mahasiswa'),
          ),
          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/quiz3'),
            child: const Text('Quiz 3 — Daftar Kontak'),
          ),
          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/quiz4'),
            child: const Text('Quiz 4 — Dashboard Kombinasi'),
          ),
          const SizedBox(height: 15),

          // ===== MENU QUIZ 5 =====
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/quiz5'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade200),
            child: const Text(
              'Quiz 5 — Analisis UX Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}