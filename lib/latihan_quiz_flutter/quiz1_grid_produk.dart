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
      title: 'Grid Produk Estetik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB4A5A5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F0),
        useMaterial3: true,
      ),
      home: const GridProdukPage(),
    );
  }
}

// ==========================
// HALAMAN GRID PRODUK
// ==========================
class GridProdukPage extends StatelessWidget {
  const GridProdukPage({super.key});

  final List<Map<String, dynamic>> produkList = const [
    {"nama": "Kopi Arabika", "harga": "Rp25.000", "icon": Icons.local_cafe, "color": Color(0xFFD4A574)},
    {"nama": "Teh Hijau", "harga": "Rp15.000", "icon": Icons.emoji_food_beverage, "color": Color(0xFFA8C5A4)},
    {"nama": "Susu Almond", "harga": "Rp30.000", "icon": Icons.local_drink, "color": Color(0xFFE5D4C1)},
    {"nama": "Coklat Panas", "harga": "Rp20.000", "icon": Icons.coffee_maker, "color": Color(0xFFC9A78A)},
    {"nama": "Matcha Latte", "harga": "Rp28.000", "icon": Icons.coffee_outlined, "color": Color(0xFFB8C5A0)},
    {"nama": "Air Mineral", "harga": "Rp5.000", "icon": Icons.water_drop, "color": Color(0xFFB8D4E8)},
    {"nama": "Es Lemon", "harga": "Rp18.000", "icon": Icons.local_bar, "color": Color(0xFFF7F4D4)},
    {"nama": "Smoothie Buah", "harga": "Rp35.000", "icon": Icons.liquor, "color": Color(0xFFF2B0B0)},
    {"nama": "Jus Buah", "harga": "Rp10.000", "icon": Icons.blender, "color": Color(0xFFF2B0E7)},
    {"nama": "Es krim", "harga": "Rp25.000", "icon": Icons.icecream, "color": Color(0xFFF2F0E2)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu Minuman",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF3D3D3D),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;

          // hitung jumlah kolom otomatis
          int crossAxisCount = (maxWidth / 220).floor();
          if (crossAxisCount < 2) crossAxisCount = 2;

          // hitung aspect ratio responsif
          double childAspectRatio =
              (maxWidth / crossAxisCount) / (maxWidth / crossAxisCount * 1.4);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: produkList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: childAspectRatio,
              ),
              itemBuilder: (context, index) {
                final produk = produkList[index];
                return ProdukCard(
                  nama: produk["nama"],
                  harga: produk["harga"],
                  icon: produk["icon"],
                  accentColor: produk["color"],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================
// WIDGET KARTU PRODUK
// ==========================
class ProdukCard extends StatefulWidget {
  final String nama;
  final String harga;
  final IconData icon;
  final Color accentColor;

  const ProdukCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.icon,
    required this.accentColor,
  });

  @override
  State<ProdukCard> createState() => _ProdukCardState();
}

class _ProdukCardState extends State<ProdukCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);

        // Hapus SnackBar lama agar tidak ikut ke halaman lain
        ScaffoldMessenger.of(context).clearSnackBars();

        // Tampilkan SnackBar hanya di halaman ini
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Anda memilih ${widget.nama}"),
            backgroundColor: widget.accentColor.withOpacity(0.9),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            duration: const Duration(seconds: 1), // cepat hilang
          ),
        );
      },
      onTapCancel: () => setState(() => isPressed = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(isPressed ? 0.96 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.accentColor.withOpacity(0.15),
              blurRadius: isPressed ? 6 : 14,
              offset: Offset(0, isPressed ? 2 : 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // ICON
              Container(
                height: 70,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.accentColor.withOpacity(0.18),
                      widget.accentColor.withOpacity(0.10),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  widget.icon,
                  size: 40,
                  color: widget.accentColor.withOpacity(0.9),
                ),
              ),

              const SizedBox(height: 12),

              // NAMA PRODUK
              Text(
                widget.nama,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const Spacer(),

              // HARGA
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.accentColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.harga,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor.withOpacity(0.95),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}