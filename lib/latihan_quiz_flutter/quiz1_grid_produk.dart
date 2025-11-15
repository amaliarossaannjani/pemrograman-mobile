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
        scaffoldBackgroundColor: const Color(0xFFF5F5F0), // warm off-white
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

  // Data produk dengan warna accent untuk setiap item
  final List<Map<String, dynamic>> produkList = const [
    {
      "nama": "Kopi Arabika",
      "harga": "Rp25.000",
      "icon": Icons.local_cafe,
      "color": Color(0xFFD4A574) // warm brown
    },
    {
      "nama": "Teh Hijau",
      "harga": "Rp15.000",
      "icon": Icons.emoji_food_beverage,
      "color": Color(0xFFA8C5A4) // sage green
    },
    {
      "nama": "Susu Almond",
      "harga": "Rp30.000",
      "icon": Icons.local_drink,
      "color": Color(0xFFE5D4C1) // cream
    },
    {
      "nama": "Coklat Panas",
      "harga": "Rp20.000",
      "icon": Icons.coffee_maker,
      "color": Color(0xFFC9A78A) // mocha
    },
    {
      "nama": "Matcha Latte",
      "harga": "Rp28.000",
      "icon": Icons.coffee_outlined,
      "color": Color(0xFFB8C5A0) // matcha green
    },
    {
      "nama": "Air Mineral",
      "harga": "Rp5.000",
      "icon": Icons.water_drop,
      "color": Color(0xFFB8D4E8) // soft blue
    },
    // Tambahkan lebih banyak item agar scroll terjadi
    { "nama": "Es Lemon", "harga": "Rp18.000", "icon": Icons.local_bar, "color": Color(0xFFF7F4D4) },
    { "nama": "Smoothie Buah", "harga": "Rp35.000", "icon": Icons.liquor, "color": Color(0xFFF2B0B0) },
    { "nama": "Jus Alpukat", "harga": "Rp27.000", "icon": Icons.local_dining, "color": Color(0xFF9DCB9D) },
    { "nama": "Boba", "harga": "Rp27.000", "icon": Icons.local_dining, "color": Color(0xFF9DCB9D) },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ==========================================
            // SLIVER APP BAR
            // ==========================================
            SliverAppBar(
              expandedHeight: 100,
              floating: true,
              snap: true,
              pinned: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF3D3D3D)),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
                title: const Text(
                  'Menu Minuman',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3D3D3D),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            
            // Grid produk
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  // TINGGI KARTU DITETAPKAN UNTUK MENCEGAH OVERFLOW
                  mainAxisExtent: 210, 
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final produk = produkList[index];
                    return ProdukCard(
                      nama: produk["nama"],
                      harga: produk["harga"],
                      icon: produk["icon"],
                      accentColor: produk["color"],
                    );
                  },
                  childCount: produkList.length,
                ),
              ),
            ),
          ],
        ),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Anda memilih ${widget.nama}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
            backgroundColor: widget.accentColor.withOpacity(0.9),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()
          ..scale(isPressed ? 0.96 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: widget.accentColor.withOpacity(0.12),
              blurRadius: isPressed ? 8 : 16,
              offset: Offset(0, isPressed ? 2 : 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: isPressed ? 4 : 8,
              offset: Offset(0, isPressed ? 1 : 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // Penyesuaian tata letak vertikal untuk responsif
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Icon container
              Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.accentColor.withOpacity(0.15),
                      widget.accentColor.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  widget.icon,
                  size: 40,
                  color: widget.accentColor.withOpacity(0.9),
                ),
              ),
              
              const SizedBox(height: 12), 
              
              // Nama produk
              Text(
                widget.nama,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                  letterSpacing: -0.2,
                  height: 1.2, 
                ),
              ),
              
              const SizedBox(height: 8), 
              
              const Spacer(), // Dorong Harga produk ke bawah
              
              // Harga produk
              Center( 
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4, 
                  ),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.harga,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.accentColor.withOpacity(0.95),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
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