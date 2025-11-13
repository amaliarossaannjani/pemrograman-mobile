import 'package:flutter/material.dart';

class CookingPortfolioPage extends StatelessWidget {
  const CookingPortfolioPage({super.key}); // ✅ tambah const constructor

  // Fungsi helper untuk tombol menu navigasi
  Widget _buildMenuButton(String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
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
    const String namaAnda = "OCA";
    const double maxWidth = 1200.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      body: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
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
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.lunch_dining, color: Color(0xFFFF6B35), size: 32),
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
                  Row(
                    children: [
                      _MenuItem(label: 'BERANDA'),
                      SizedBox(width: 40),
                      _MenuItem(label: 'RESEP'),
                      SizedBox(width: 40),
                      _MenuItem(label: 'TENTANG'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // BODY
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFF8F0), Color(0xFFFFE8D6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Kolom kiri
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome to my KITCHEN!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFFF6B35),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "I'M $namaAnda",
                            style: const TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'JURU MASAK RUMAHAN & PECINTA KULINER',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF6B35),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B35),
                                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
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
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
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
                    const SizedBox(width: 80),
                    // Kolom kanan
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 400,
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

// Widget menu item biar lebih rapih
class _MenuItem extends StatelessWidget {
  final String label;
  const _MenuItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigasi ke $label'),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}