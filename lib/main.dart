import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart'; // Import HomePage.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration:
              const Duration(milliseconds: 1000), // Durasi transisi
          pageBuilder: (_, __, ___) => HomePage(), // Ganti dengan HomePage
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Gambar akan mengisi seluruh ruang layar
        children: [
          Image.asset(
            'assets/landing_page.png', // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Penyesuaian gambar dengan ukuran layar
          ),
          // Tambahkan konten di atas gambar jika diperlukan
        ],
      ),
    );
  }
}
