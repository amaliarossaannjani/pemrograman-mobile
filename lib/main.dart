import 'package:flutter/material.dart';
import 'package:flutter_application_1/tugas_baru.dart';
import 'package:flutter_application_1/cookingPortfolioPage.dart'; // ✅ pastikan nama file sesuai

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Tugas & Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainMenuScreen(),
      routes: {
        '/tugas_baru': (_) => const ProfilMahasiswaPage(),
        '/portfolio': (_) => const CookingPortfolioPage(), // ✅ sudah fix
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }
}