import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apps_food/views/init_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 🔥 Timer 3 detik, setelah itu pindah permanen ke InitScreen
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => InitScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan warna background dengan logo
      body: Center(
        // 🔥 Menampilkan Logo dari folder assets
        child: Image.asset(
          'assets/Dipesan.png', // Pastikan nama filenya sama persis
          width: 200, // Atur besar/kecilnya ukuran logo di sini
        ),
      ),
    );
  }
}
