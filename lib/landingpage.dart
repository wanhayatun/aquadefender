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
    // Navigasi ke halaman Home setelah jeda waktu 2 detik
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Tampilkan gambar landing page
          Image.asset(
            'assets/landing_page.png',
            fit: BoxFit.cover,
          ),
          // Tambahkan konten di atas gambar jika diperlukan
        ],
      ),
    );
  }
}
