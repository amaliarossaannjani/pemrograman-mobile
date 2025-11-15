import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz3Wrapper());
}

// ==========================
// WRAPPER QUIZ 3 (Tanpa MaterialApp di sini)
// ==========================
class Quiz3Wrapper extends StatefulWidget {
  const Quiz3Wrapper({super.key});

  @override
  State<Quiz3Wrapper> createState() => _Quiz3WrapperState();
}

class _Quiz3WrapperState extends State<Quiz3Wrapper> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = (_themeMode == ThemeMode.dark)
        ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFB8C5A0),
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF1A1A1A),
            cardColor: const Color(0xFF2B2B2B),
          )
        : ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFB8C5A0),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: const Color(0xFFF5F5F0),
            cardColor: Colors.white,
          );

    // AnimatedTheme agar transisi mode gelap/terang lebih halus
    return AnimatedTheme(
      data: currentTheme,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Soal3KontakPage(
        onToggleTheme: _toggleTheme,
        themeMode: _themeMode,
      ),
    );
  }
}

// ==========================
// HALAMAN DAFTAR KONTAK
// ==========================
class Soal3KontakPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const Soal3KontakPage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeMode == ThemeMode.dark;

    final List<Map<String, dynamic>> kontak = [
      {"nama": "Amalia", "phone": "0812-3333-1111", "status": "Online", "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Amalia"},
      {"nama": "Diga", "phone": "0851-5522-8899", "status": "Offline", "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Diga"},
      {"nama": "Anjeli", "phone": "0895-2211-7788", "status": "Away", "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Anjeli"},
      {"nama": "Akbar", "phone": "0878-9999-4444", "status": "Online", "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Akbar"},
      {"nama": "Andin", "phone": "0856-7777-3333", "status": "Away", "avatar": "https://api.dicebear.com/7.x/avataaars/png?seed=Andin"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Kontak", style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color(0xFF2B2B2B) : const Color(0xFFB8C5A0),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.dark_mode,
                color: isDarkMode ? Colors.yellow : Colors.white),
            tooltip: isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode",
            onPressed: onToggleTheme,
          ),
        ],
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

  Color _getStatusColor(String status) {
    switch (status) {
      case "Online":
        return const Color(0xFF7CB342);
      case "Offline":
        return const Color(0xFF9E9E9E);
      case "Away":
        return const Color(0xFFFFB74D);
      default:
        return const Color(0xFF90A4AE);
    }
  }

  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8C5A0).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phone_in_talk, size: 40, color: Color(0xFFB8C5A0)),
              ),
              const SizedBox(height: 20),
              const Text("Panggil Kontak", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Text(
                'Apakah Anda ingin memanggil\n${widget.nama}?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.4, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8C5A0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.phone,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFB8C5A0)),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text("Batal")),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Memanggil ${widget.nama}..."),
                            backgroundColor: const Color(0xFFB8C5A0),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFB8C5A0)),
                      child: const Text("Panggil"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB8C5A0).withOpacity(0.12),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          leading: CircleAvatar(radius: 28, backgroundImage: NetworkImage(widget.avatarUrl)),
          title: Text(widget.nama, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(widget.phone, style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: _getStatusColor(widget.status), shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Text(widget.status, style: TextStyle(fontWeight: FontWeight.w600, color: _getStatusColor(widget.status))),
                ],
              ),
            ],
          ),
          trailing: IconButton(icon: const Icon(Icons.phone), color: const Color(0xFFB8C5A0), onPressed: () => _showCallDialog(context)),
        ),
      ),
    );
  }
}