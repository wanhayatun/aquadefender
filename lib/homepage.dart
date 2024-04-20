import 'package:flutter/material.dart';
import 'halamanaliran.dart'; // Import halaman selanjutnya

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

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
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.0), // Spasi di kiri tulisan "Search"
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        suffixIcon: _searchController.text.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                },
                                child: Icon(Icons.clear),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                child: Icon(Icons.add, color: Colors.black),
              ),
            ),
          ),
          // Lingkaran kecil "tinggi"
          Positioned(
            bottom: 100.0,
            left: 20.0,
            child: Column(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 249, 9),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
          // Tulisan "Tinggi" di sebelah lingkaran "tinggi"
          Positioned(
            bottom: 100.0,
            left: 50.0,
            child: Text('Tinggi', style: TextStyle(color: Colors.white)),
          ),
          // Lingkaran kecil "rendah"
          Positioned(
            bottom: 70.0,
            left: 20.0,
            child: Column(
              children: [
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 16, 0),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
          // Tulisan "Rendah" di sebelah lingkaran "rendah"
          Positioned(
            bottom: 70.0,
            left: 50.0,
            child: Text('Rendah', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
