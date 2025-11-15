import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz2KartuProfil());
}

// ==========================
// APLIKASI UTAMA
// ==========================
class Quiz2KartuProfil extends StatelessWidget {
  const Quiz2KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA8C5A4),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F0),
        useMaterial3: true,
      ),
      home: const ProfilMahasiswaPage2(),
    );
  }
}

// ==========================
// HALAMAN PROFIL MAHASISWA
// ==========================
class ProfilMahasiswaPage2 extends StatefulWidget {
  const ProfilMahasiswaPage2({super.key});

  @override
  State<ProfilMahasiswaPage2> createState() => _ProfilMahasiswaPageState();
}

class _ProfilMahasiswaPageState extends State<ProfilMahasiswaPage2> {
  String _selectedAvatar = 'https://api.dicebear.com/7.x/avataaars/png?seed=Amalia';

  final List<Map<String, String>> _avatarOptions = [
    {'url': 'https://api.dicebear.com/7.x/avataaars/png?seed=Amalia', 'name': 'Avatar 1'},
    {'url': 'https://api.dicebear.com/7.x/big-smile/png?seed=Amalia', 'name': 'Avatar 2'},
    {'url': 'https://api.dicebear.com/7.x/lorelei/png?seed=Amalia', 'name': 'Avatar 3'},
    {'url': 'https://api.dicebear.com/7.x/notionists/png?seed=Amalia', 'name': 'Avatar 4'},
    {'url': 'https://api.dicebear.com/7.x/adventurer/png?seed=Amalia', 'name': 'Avatar 5'},
    {'url': 'https://api.dicebear.com/7.x/micah/png?seed=Amalia', 'name': 'Avatar 6'},
  ];

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 20),
              const Text('Pilih Foto Profil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF2D2D2D))),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _avatarOptions.map((avatar) {
                  final isSelected = _selectedAvatar == avatar['url'];
                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedAvatar = avatar['url']!);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? const Color(0xFFA8C5A4) : Colors.grey[300]!,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(radius: 35, backgroundColor: Colors.grey[100], backgroundImage: NetworkImage(avatar['url']!)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  void _showDetailProfil() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: const Color(0xFFA8C5A4).withOpacity(0.15), shape: BoxShape.circle),
                  child: const Icon(Icons.person_outline, size: 40, color: Color(0xFFA8C5A4)),
                ),
                const SizedBox(height: 20),
                const Text('Detail Mahasiswa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF2D2D2D))),
                const SizedBox(height: 24),
                _buildDetailRow(Icons.person, 'Nama', 'Amalia Rossa Annjani'),
                const SizedBox(height: 16),
                _buildDetailRow(Icons.badge, 'NIM', '221080200023'),
                const SizedBox(height: 16),
                _buildDetailRow(Icons.school, 'Program Studi', 'Teknik Informatika'),
                const SizedBox(height: 16),
                _buildDetailRow(Icons.email, 'Email', 'amalia@gmail.com'),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA8C5A4),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text('Tutup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFFA8C5A4).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 20, color: const Color(0xFFA8C5A4)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 15, color: Color(0xFF2D2D2D), fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      appBar: AppBar(
        title: const Text('Profil Mahasiswa', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.3)),
        centerTitle: true,
        backgroundColor: const Color(0xFFA8C5A4),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ProfilCard(
            nama: 'Amalia Rossa Annjani',
            nim: '221080200023',
            prodi: 'Teknik Informatika',
            avatarUrl: _selectedAvatar,
            onChangeAvatar: _showAvatarPicker,
            onShowDetail: _showDetailProfil,
          ),
        ),
      ),
    );
  }
}

// ==========================
// WIDGET KARTU PROFIL
// ==========================
class ProfilCard extends StatefulWidget {
  final String nama;
  final String nim;
  final String prodi;
  final String avatarUrl;
  final VoidCallback onChangeAvatar;
  final VoidCallback onShowDetail;

  const ProfilCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.avatarUrl,
    required this.onChangeAvatar,
    required this.onShowDetail,
  });

  @override
  State<ProfilCard> createState() => _ProfilCardState();
}

class _ProfilCardState extends State<ProfilCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () {}, // Bisa dikosongkan atau menambahkan aksi tambahan
        onHighlightChanged: (value) => setState(() => _isPressed = value),
        splashColor: const Color(0xFFA8C5A4).withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(color: const Color(0xFFA8C5A4).withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 8)),
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: widget.onChangeAvatar,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFA8C5A4).withOpacity(0.3), width: 3),
                          boxShadow: [BoxShadow(color: const Color(0xFFA8C5A4).withOpacity(0.2), blurRadius: 12, spreadRadius: 2)],
                        ),
                        child: CircleAvatar(radius: 60, backgroundColor: Colors.grey[100], backgroundImage: NetworkImage(widget.avatarUrl)),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA8C5A4),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(widget.nama, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF2D2D2D), letterSpacing: -0.5, height: 1.2)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(color: const Color(0xFFA8C5A4).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                  child: Text('NIM: ${widget.nim}', style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500, letterSpacing: 0.3)),
                ),
                const SizedBox(height: 8),
                Text(widget.prodi, style: const TextStyle(fontSize: 16, color: Color(0xFFA8C5A4), fontWeight: FontWeight.w600)),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: widget.onShowDetail,
                    icon: const Icon(Icons.info_outline, size: 20),
                    label: const Text('Lihat Detail'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA8C5A4),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}