import 'package:flutter/material.dart';

// ==========================
// APLIKASI WRAPPER QUIZ 4 (Perbaikan: TIDAK ADA MaterialApp di sini!)
// ==========================
class Quiz4Wrapper extends StatefulWidget {
  const Quiz4Wrapper({super.key});

  @override
  State<Quiz4Wrapper> createState() => _Quiz4WrapperState();
}

class _Quiz4WrapperState extends State<Quiz4Wrapper> {
  // State untuk mengelola Dark/Light Mode
  ThemeMode _themeMode = ThemeMode.light; 

  void _toggleTheme() {
    setState(() {
      _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // FIX UTAMA: 
    // Menggunakan Builder untuk mendapatkan konteks tema yang benar 
    // yang akan diwarisi dari MyApp di atas, dan kemudian memaksa 
    // tema yang diinginkan melalui Theme() widget
    
    // Kita akan menggunakan tema dari MyApp, tetapi menyesuaikan ThemeMode-nya
    final currentTheme = _themeMode == ThemeMode.dark 
        ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF42A5F5), brightness: Brightness.dark),
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
          ) 
        : ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF42A5F5), brightness: Brightness.light),
            scaffoldBackgroundColor: const Color(0xFFE1F5FE),
          );

    return Theme(
      data: currentTheme,
      // Menggunakan Builder untuk memastikan konteksnya benar saat men-render Dashboard
      child: Builder(
        builder: (context) {
          return Quiz4DashboardPage(
            onToggleTheme: _toggleTheme, 
            themeMode: _themeMode
          );
        }
      ),
    );
  }
}

// ==========================
// HALAMAN DASHBOARD
// ==========================
class Quiz4DashboardPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const Quiz4DashboardPage(
      {super.key, required this.onToggleTheme, required this.themeMode});

  void _showAlert(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Info'),
          content: Text('$title diklik!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext), 
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  void _showMahasiswaDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detail Profil Mahasiswa'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama: Amalia Rossa Annjani"),
              Text("NIM: 22108020023"),
              Text("Prodi: Informatika"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext), 
              child: const Text('Tutup'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    const Color primaryColor = Color(0xFF42A5F5);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color(0xFF212121) : const Color(0xFFBBDEFB),
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        elevation: 2,
        toolbarHeight: 50,
        
        // leading: IconButton disarankan dihapus, karena Navigator.pushNamed 
        // akan otomatis menambahkannya. Namun, untuk memastikan fungsi back 
        // yang eksplisit seperti permintaan Anda:
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            // Ini akan kembali ke MainMenuScreen karena sekarang berada di tumpukan navigasi yang sama.
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode ? Colors.yellow : Colors.blueGrey,
            ),
            onPressed: onToggleTheme,
            tooltip:
                isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Grid Kategori
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Kategori Utama:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 75, 
              child: Row(
                children: [
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.person,
                          label: "Profil",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Profil"))),
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.shopping_cart,
                          label: "Produk",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Produk"))),
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.message,
                          label: "Pesan",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Pesan"))),
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.settings,
                          label: "Pengaturan",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Pengaturan"))),
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.star,
                          label: "Favorit",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Favorit"))),
                  Expanded(
                      child: _KategoriItem(
                          icon: Icons.help,
                          label: "Bantuan",
                          iconColor: primaryColor,
                          onTap: () => _showAlert(context, "Bantuan"))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            
            // Card Info Profil Mahasiswa
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => _showMahasiswaDetail(context),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: isDarkMode
                                  ? Colors.blue.shade900
                                  : const Color(0xFFBBDEFB),
                              child: Icon(Icons.person_pin,
                                  size: 35, color: primaryColor),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: isDarkMode
                                          ? const Color(0xFF1E1E1E)
                                          : Colors.white,
                                      width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amalia Rossa",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Ketuk untuk Detail",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: isDarkMode
                                      ? Colors.grey
                                      : Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 16,
                            color: isDarkMode
                                ? Colors.grey.shade600
                                : Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10),
            
            // List Aktivitas Terakhir
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                    child: Text(
                      "Aktivitas Terakhir:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _AktivitasItem(
                            title: "Mengupdate Profil",
                            subtitle: "2 menit lalu",
                            icon: Icons.edit,
                            iconColor: primaryColor,
                            onTap: () =>
                                _showAlert(context, "Mengupdate Profil")),
                        _AktivitasItem(
                            title: "Melihat Produk Baru",
                            subtitle: "10 menit lalu",
                            icon: Icons.shopping_bag,
                            iconColor: primaryColor,
                            onTap: () =>
                                _showAlert(context, "Melihat Produk Baru")),
                        _AktivitasItem(
                            title: "Menghubungi Kontak",
                            subtitle: "30 menit lalu",
                            icon: Icons.phone,
                            iconColor: primaryColor,
                            onTap: () =>
                                _showAlert(context, "Menghubungi Kontak")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================
// WIDGET KATEGORI
// ==========================
class _KategoriItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _KategoriItem(
      {required this.icon,
      required this.label,
      required this.onTap,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(4.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: iconColor), 
              const SizedBox(height: 2), 
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10, 
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================
// WIDGET AKTIVITAS
// ==========================
class _AktivitasItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const _AktivitasItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        onTap: onTap,
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.grey : Colors.grey.shade700,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 14,
            color: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade600),
      ),
    );
  }
}