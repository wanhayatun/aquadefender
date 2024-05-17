import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'homepage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fl_chart/fl_chart.dart';


class DetailTitik extends StatefulWidget {
  const DetailTitik({Key? key}) : super(key: key);

  @override
  _DetailTitikState createState() => _DetailTitikState();
}

class _DetailTitikState extends State<DetailTitik> {
  double kecepatanAir_A = 0.0;
  double ketinggianAir_A = 0.0;

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
        // Konversi nilai ke tipe data double
        setState(() {
          kecepatanAir_A = double.parse(event.snapshot.value.toString());
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
        // Konversi nilai ke tipe data double
        setState(() {
          ketinggianAir_A = double.parse(event.snapshot.value.toString());
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
                              'Titik A',
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
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 280,
                    height: 280,
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          maximum: 5,
                          interval: 1,
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: kecepatanAir_A,
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
                  VerticalBarIndicator(
                    percent: ketinggianAir_A / 100.0,

                    header: 'Ketinggian Air A',
                    footer: '$ketinggianAir_A cm',
                    height: 150,
                    width: 250,
                    color: [
                      Colors.blue.withOpacity(0.5),
                      Colors.blue,
                    ],
                    circularRadius: 0,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          backgroundColor: Colors.white,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/lokasiikon.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
