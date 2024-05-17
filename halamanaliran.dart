import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'detail_titik.dart';
import 'detail_titik2.dart'; // Pastikan file detail_titik2.dart ada di lokasi yang benar
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HalamanAliran extends StatefulWidget {
  const HalamanAliran({Key? key}) : super(key: key);

  @override
  _HalamanAliranState createState() => _HalamanAliranState();
}

class _HalamanAliranState extends State<HalamanAliran> {
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 35,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 130),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/Lokasi.png',
                          width: 50,
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25),
                            Text(
                              'Aliran Utama',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tungkop, Darussalam',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 3,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            color: const Color.fromARGB(255, 124, 124, 124),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTitik()),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            'Titik A',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1),
                          Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(10),
                            child: SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  maximum: 5,
                                  interval: 1,
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                      value: KecepatanAir_A,
                                      needleEndWidth: 5,
                                    )
                                  ],
                                  labelsPosition: ElementsPosition.outside,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                      startValue: 0,
                                      endValue: 100,
                                      color: Colors.blue,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTitik2()),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            'Titik B',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1),
                          Container(
                            width: 200,
                            height: 200,
                            padding: EdgeInsets.all(10),
                            child: SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  maximum: 5,
                                  interval: 1,
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                      value: KecepatanAir_B,
                                      needleEndWidth: 5,
                                    )
                                  ],
                                  labelsPosition: ElementsPosition.outside,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                      startValue: 0,
                                      endValue: 100,
                                      color: Colors.blue,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: VerticalBarIndicator(
                  percent: ketinggianAir_A / 100,
                  header: 'Ketinggian Air A',
                  footer: '$ketinggianAir_A Cm',
                  height: 200,
                  width: 130,
                  color: [
                    Colors.blue.withOpacity(0.5),
                    Colors.blue,
                  ],
                  circularRadius: 0,
                ),
              ),
              Expanded(
                child: VerticalBarIndicator(
                  percent: 40/100,
                  header: 'Ketinggian Air B',
                  footer: '$ketinggianAir_B Cm',
                  height: 200,
                  width: 130,
                  color: [
                    Colors.blue.withOpacity(0.5),
                    Colors.blue,
                  ],
                  circularRadius: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}