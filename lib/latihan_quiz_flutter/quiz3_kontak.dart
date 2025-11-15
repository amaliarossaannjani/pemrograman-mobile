import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==========================
// APLIKASI UTAMA
// ==========================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Kontak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB8C5A0),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F0),
        useMaterial3: true,
      ),
      home: const Soal3KontakPage(),
    );
  }
}

// ==========================
// HALAMAN DAFTAR KONTAK
// ==========================
class Soal3KontakPage extends StatelessWidget {
  const Soal3KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data kontak dengan avatar URL
    final List<Map<String, dynamic>> kontak = [
      {
        "nama": "Amalia",
        "phone": "0812-3333-1111",
        "status": "Online",
        "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Amalia"
      },
      {
        "nama": "Diga",
        "phone": "0851-5522-8899",
        "status": "Offline",
        "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Diga"
      },
      {
        "nama": "Anjeli",
        "phone": "0895-2211-7788",
        "status": "Away",
        "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Anjeli"
      },
      {
        "nama": "Akbar",
        "phone": "0878-9999-4444",
        "status": "Online",
        "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Budi"
      },
      {
        "nama": "Andin",
        "phone": "0856-7777-3333",
        "status": "Away",
        "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Clara"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
        title: const Text(
          "Daftar Kontak",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB8C5A0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kontak.length,
        itemBuilder: (context, index) {
          final item = kontak[index];
          return KontakCard(
            nama: item["nama"],
            phone: item["phone"],
            status: item["status"],
            avatarUrl: item["avatar"],
          );
        },
      ),
    );
  }
}

// ==========================
// WIDGET KARTU KONTAK
// ==========================
class KontakCard extends StatefulWidget {
  final String nama;
  final String phone;
  final String status;
  final String avatarUrl;

  const KontakCard({
    super.key,
    required this.nama,
    required this.phone,
    required this.status,
    required this.avatarUrl,
  });

  @override
  State<KontakCard> createState() => _KontakCardState();
}

class _KontakCardState extends State<KontakCard> {
  bool _isPressed = false;

  // Fungsi untuk mendapatkan warna status
  Color _getStatusColor(String status) {
    switch (status) {
      case "Online":
        return const Color(0xFF7CB342); // soft green
      case "Offline":
        return const Color(0xFF9E9E9E); // soft grey
      case "Away":
        return const Color(0xFFFFB74D); // soft orange
      default:
        return const Color(0xFF90A4AE); // blue grey
    }
  }

  // Fungsi untuk menampilkan dialog konfirmasi panggilan
  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB8C5A0).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.phone_in_talk,
                    size: 40,
                    color: Color(0xFFB8C5A0),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Title
                const Text(
                  'Panggil Kontak',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
                const SizedBox(height: 12),
                
                // Message
                Text(
                  'Apakah Anda ingin memanggil\n${widget.nama}?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Phone number
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB8C5A0).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.phone,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB8C5A0),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                
                const SizedBox(height: 28),
                
                // Action buttons
                Row(
                  children: [
                    // Tombol batal
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.grey[700],
                          side: BorderSide(color: Colors.grey[300]!),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Batal',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Tombol panggil
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  const Icon(
                                    Icons.phone_in_talk,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'Memanggil ${widget.nama}...',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: const Color(0xFFB8C5A0),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.all(16),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB8C5A0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Panggil',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        margin: const EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFB8C5A0).withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            
            // Avatar dengan gambar
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getStatusColor(widget.status).withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[100],
                backgroundImage: NetworkImage(widget.avatarUrl),
              ),
            ),
            
            // Nama dan info kontak
            title: Text(
              widget.nama,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
                letterSpacing: -0.2,
              ),
            ),
            
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                // Nomor telepon
                Text(
                  widget.phone,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 8),
                // Status dengan indikator
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _getStatusColor(widget.status),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: _getStatusColor(widget.status).withOpacity(0.4),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.status,
                      style: TextStyle(
                        fontSize: 13,
                        color: _getStatusColor(widget.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Tombol panggil
            trailing: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFB8C5A0).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.phone),
                color: const Color(0xFFB8C5A0),
                iconSize: 22,
                onPressed: () => _showCallDialog(context),
                tooltip: 'Panggil ${widget.nama}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}