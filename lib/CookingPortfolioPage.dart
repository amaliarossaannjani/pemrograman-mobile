import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Diperlukan untuk SystemMouseCursors

class CookingPortfolioPage extends StatelessWidget {
  const CookingPortfolioPage({super.key});

  // Helper untuk menampilkan notifikasi saat menu diklik
  void _showMenuAction(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigasi ke $label')),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String namaAnda = "OCA";
    const double desktopMaxWidth = 1200.0;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Breakpoint: Layar di atas 800 dianggap Desktop
    final bool isDesktop = screenWidth > 800;
    
    // Padding adaptif
    final double horizontalPadding = isDesktop ? 80 : 20;
    final double verticalPadding = isDesktop ? 40 : 20;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      body: Column(
        children: [
          // ==========================
          // 1. HEADER (RESPONSIVE)
          // ==========================
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: desktopMaxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo/Title
                  Row(
                    children: const [
                      Icon(Icons.lunch_dining,
                          color: Color(0xFFFF6B35), size: 32),
                      SizedBox(width: 10),
                      Text(
                        'KOKI SANTUY',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6B35),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  
                  // Menu Navigasi (Hanya muncul di Desktop)
                  if (isDesktop)
                    Row(
                      children: [
                        _MenuItem(label: 'BERANDA', onTap: () => _showMenuAction(context, 'BERANDA')),
                        const SizedBox(width: 40),
                        _MenuItem(label: 'RESEP', onTap: () => _showMenuAction(context, 'RESEP')),
                        const SizedBox(width: 40),
                        _MenuItem(label: 'TENTANG', onTap: () => _showMenuAction(context, 'TENTANG')),
                      ],
                    )
                  else
                    // Tombol Menu untuk Mobile
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black54),
                      onPressed: () => _showMenuAction(context, 'Menu Mobile'),
                    ),
                ],
              ),
            ),
          ),

          // ==========================
          // 2. BODY (RESPONSIVE)
          // ==========================
          Expanded(
            child: SingleChildScrollView( // Mengatasi overflow pada mobile
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFF8F0), Color(0xFFFFE8D6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: desktopMaxWidth),
                  
                  // Perubahan utama: Switch Row/Column berdasarkan isDesktop
                  child: isDesktop
                      ? Row(
                          // Desktop Layout: Hero (Kiri) + Quote (Kanan)
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildContentChildren(context, namaAnda, isDesktop),
                        )
                      : Column(
                          // Mobile Layout: Hero (Atas) + Quote (Bawah)
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _buildContentChildren(context, namaAnda, isDesktop),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget builder untuk konten utama agar bisa di-switch antara Row/Column
  List<Widget> _buildContentChildren(BuildContext context, String namaAnda, bool isDesktop) {
    // 1. Hero Section (Teks Utama & Tombol)
    final heroSection = Expanded(
      flex: isDesktop ? 5 : 0,
      child: Padding(
        padding: isDesktop ? EdgeInsets.zero : const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisAlignment: isDesktop ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to my KITCHEN!',
              style: TextStyle(
                fontSize: 18, 
                color: Color(0xFFFF6B35),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "I'M $namaAnda",
              style: TextStyle(
                fontSize: isDesktop ? 56 : 40, // Responsive Font Size
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'JURU MASAK RUMAHAN & PECINTA KULINER',
              style: TextStyle(
                fontSize: isDesktop ? 22 : 16, // Responsive Font Size
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFF6B35),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Bersemangat dalam membuat masakan rumahan yang lezat dan membagikan resep favorit saya. Mari bergabung dalam petualangan kuliner ini dan temukan keceriaan memasak!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showMenuAction(context, 'LIHAT RESEP'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'LIHAT RESEP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () => _showMenuAction(context, 'TENTANG SAYA'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Color(0xFFFF6B35), width: 2),
                  ),
                  child: const Text(
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
    );

    // 2. Quote Section (Card Kutipan)
    final quoteSection = Expanded(
      flex: isDesktop ? 4 : 0,
      child: isDesktop ? Center(child: _buildQuoteCard()) : _buildQuoteCard(),
    );

    // Mengembalikan list Widget sesuai layout
    if (isDesktop) {
      return [
        heroSection,
        const SizedBox(width: 80), // Pemisah di Desktop
        quoteSection,
      ];
    } else {
      return [
        heroSection,
        quoteSection,
      ];
    }
  }

  // Widget Card Kutipan yang terpisah
  Widget _buildQuoteCard() {
    return Container(
      height: 300, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.format_quote, size: 40, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '"Memasak adalah salah satu cara untuk bisa bertahan hidup!"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "koki santuy~",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF6B35),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget menu item biar lebih rapih (diperbarui untuk menangani onTap)
class _MenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  
  const _MenuItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
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
}