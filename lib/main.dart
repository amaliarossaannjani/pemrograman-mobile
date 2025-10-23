import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil',
      theme: ThemeData(
        // Tema warna oranye/peach yang sesuai dengan desain
        primarySwatch: Colors.deepOrange, 
        fontFamily: 'Inter', // Menggunakan font modern
      ),
      home: CookingPortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CookingPortfolioPage extends StatelessWidget {
  // Fungsi helper untuk tombol navigasi
  Widget _buildMenuButton(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Aksi navigasi di sini
          print('Navigasi ke $label');
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Menentukan lebar maksimal agar konten terlihat rapi di layar besar
    final maxWidth = 1200.0;
    
    // Placeholder untuk nama Anda
    const String namaAnda = "OCA"; // Pastikan ini adalah nama Anda

    return Scaffold(
      backgroundColor: Color(0xFFFFFBF5),
      body: Column(
        children: [
          // 1. Header (Navigation Bar)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Ikon Topi Koki yang Ditingkatkan (menggunakan Icons.lunch_dining sebagai representasi Topi Koki)
                      Icon(Icons.lunch_dining, color: Color(0xFFFF6B35), size: 32), 
                      SizedBox(width: 10),
                      Text(
                        'KOKI SANTUY', // Nama Header
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B35),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildMenuButton('BERANDA'), 
                      SizedBox(width: 40),
                      _buildMenuButton('RESEP'), 
                      SizedBox(width: 40),
                      _buildMenuButton('TENTANG'), 
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 2. Hero Section (Dua Kolom: Kiri Teks, Kanan Hiasan)
          Expanded(
            child: Container(
              alignment: Alignment.center, 
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFF8F0), Color(0xFFFFE8D6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Kolom KIRI: Teks dan Tombol
                    Expanded(
                      flex: 5, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to my KITCHEN!', // Perbaikan teks
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFF6B35),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 15),
                          
                          Text(
                            "I'M $namaAnda", // Perbaikan teks
                            style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(height: 10),
                          
                          Text(
                            'JURU MASAK RUMAHAN & PECINTA KULINER', 
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF6B35),
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 30),
                          
                          Container(
                             constraints: BoxConstraints(maxWidth: 550), 
                             child: Text(
                               'Bersemangat dalam membuat masakan rumahan yang lezat dan membagikan resep favorit saya. Mari bergabung dalam petualangan kuliner ini dan temukan keceriaan memasak!',
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.black87,
                                 height: 1.6,
                               ),
                             ),
                           ),
                          SizedBox(height: 40),
                          
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF6B35),
                                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'LIHAT RESEP', 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(color: Color(0xFFFF6B35), width: 2),
                                ),
                                child: Text(
                                  'TENTANG SAYA', 
                                  style: TextStyle(
                                    color: Color(0xFFFF6B35),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(width: 80), 
                    
                    // Kolom KANAN: Hiasan (Tanpa Foto)
                    Expanded(
                      flex: 4, 
                      child: Container(
                        height: 400, 
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFF6B35).withOpacity(0.2), 
                              blurRadius: 40,
                              offset: Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_quote, size: 40, color: Colors.grey[300]), 
                              SizedBox(height: 20),
                              Container(
                                constraints: BoxConstraints(maxWidth: 250),
                                child: Text(
                                  '"Memasak adalah salah satu cara untuk bisa bertahan hidup!"', 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18, 
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey[700],
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "koki santuy~", // Perbaikan teks
                                style: TextStyle(
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF6B35),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}