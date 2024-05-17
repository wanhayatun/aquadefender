// Import library yang dibutuhkan
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'halamanaliran.dart'; // Import halaman selanjutnya
import 'detail_titik.dart';
import 'detail_titik2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double topMarkerPosition = 50.0; // Posisi vertikal penanda lokasi atas
  double bottomMarkerPosition = 150.0; // Posisi vertikal penanda lokasi bawah
  double leftMarkerPosition = 100.0; // Posisi horizontal penanda lokasi
  double KecepatanAir_A = 0.0;
  double KecepatanAir_B = 0.0;
  double ketinggianAir_A = 0.0;
  double ketinggianAir_B = 0.0;

  @override
  void initState() {
    super.initState();
    //manggil firebase
    FirebaseDatabase.instance
        .ref()
        .child('kecepatanairA') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          KecepatanAir_A = double.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance
        .ref()
        .child('kecepatanairB') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          KecepatanAir_B = double.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance
        .ref()
        .child('ketinggianairA') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          ketinggianAir_A = double.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance
        .ref()
        .child('ketinggianairB') // Menggunakan '' sebagai kunci
        .onValue
        .listen((event) {
      print('Nilai dari Firebase: ${event.snapshot.value}');
      // Memeriksa apakah event.snapshot.value tidak null sebelum mengaksesnya
      if (event.snapshot.value != null) {
        // Konversi nilai ke tipe data int
        setState(() {
          ketinggianAir_B = double.parse(event.snapshot.value.toString());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/maps.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Tombol di sudut kanan bawah untuk navigasi ke halaman selanjutnya
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HalamanAliran()),
                );
              },
              child: Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Image.asset('assets/Homepage.png'),
              ),
            ),
          ),
          // Gambar penanda lokasi atas (Titik A)
          Positioned(
            top: topMarkerPosition + 120,
            left: leftMarkerPosition + 160,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTitik()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/Lokasi.png',
                    width: 40.0, // Ubah lebar gambar ikon lokasi
                    height: 50.0, // Ubah tinggi gambar ikon lokasi
                  ),
                  SizedBox(width: 10.0), // Spasi antara ikon dan lingkaran
                  Container(
                    width: 15.0, // Lebar lingkaran kecil
                    height: 15.0, // Tinggi lingkaran kecil
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 255, 17, 0), // Warna lingkaran kecil
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 5.0), // Spasi antara lingkaran dan teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$KecepatanAir_A m/s2', // Informasi kecepatan
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$ketinggianAir_A cm', // Informasi ketinggian air
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Gambar penanda lokasi bawah (Titik B)
          Positioned(
            bottom: bottomMarkerPosition + 25,
            left: leftMarkerPosition + 169, // Menggeser posisi untuk titik B
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTitik2()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/Lokasi.png',
                    width: 40.0, // Ubah lebar gambar ikon lokasi
                    height: 50.0, // Ubah tinggi gambar ikon lokasi
                  ),
                  SizedBox(width: 10.0), // Spasi antara ikon dan lingkaran
                  Container(
                    width: 15.0, // Lebar lingkaran kecil
                    height: 15.0, // Tinggi lingkaran kecil
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 13, 255, 0), // Warna lingkaran kecil
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 5.0), // Spasi antara lingkaran dan teks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$KecepatanAir_B m/s2', // Informasi kecepatan
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$ketinggianAir_B cm', // Informasi ketinggian air
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5.0), // Spasi antara teks dan ikon
                ],
              ),
            ),
          ),

          // Lingkaran kecil "tinggi"
          Positioned(
            bottom: 100.0,
            left: 37.0,
            child: Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 0, 0),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Tinggi', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // Lingkaran kecil "Normal"
          Positioned(
            bottom: 60.0,
            left: 37.0,
            child: Row(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 255, 64),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 5.0),
                Text('Normal', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
