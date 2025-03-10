import 'package:flutter/material.dart';
import 'package:pariwisata_indonesia/screens/home/home_screen.dart';
import 'loading_page/splash_screen.dart';
// Import untuk custom fonts - Tambahkan setelah konfigurasi di pubspec.yaml
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Memastikan widget binding diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Mengubah judul aplikasi
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug

      theme: ThemeData(
        // Konfigurasi tema aplikasi
        colorScheme: ColorScheme.fromSeed(
          // Menggunakan warna Merah sebagai representasi Indonesia
          seedColor: const Color(0xFFE4002B),
          // Mengatur brightness agar mendukung mode gelap
          brightness: Brightness.light,
        ),

        // Konfigurasi font untuk aplikasi
        textTheme: GoogleFonts.poppinsTextTheme(),

        // Mengaktifkan Material 3
        useMaterial3: true,

        // Konfigurasi AppBar default
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),

        // Konfigurasi Card default
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Konfigurasi tema gelap (opsional)
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE4002B),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),

      // Menggunakan tema sistem
      themeMode: ThemeMode.system,

      // Route awal aplikasi
      home: const SplashScreen(),
      // home: const HomeScreen(),
    );
  }
}
