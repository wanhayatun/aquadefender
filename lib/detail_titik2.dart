import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'homepage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailTitik2 extends StatefulWidget {
  const DetailTitik2({Key? key}) : super(key: key);

  @override
  _DetailTitik2State createState() => _DetailTitik2State();
}

class _DetailTitik2State extends State<DetailTitik2> {
  double kecepatanAirB = 0.0;
  double ketinggianAirB = 0.0;

  @override
  void initState() {
    super.initState();
    // Fetch data from Firebase
    FirebaseDatabase.instance
        .ref()
        .child('kecepatanairB')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          kecepatanAirB = double.parse(event.snapshot.value.toString());
        });
      }
    });

    FirebaseDatabase.instance
        .ref()
        .child('ketinggianairB')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          ketinggianAirB = double.parse(event.snapshot.value.toString());
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
                              'Titik B',
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
                          maximum: 100,
                          interval: 25,
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: kecepatanAirB,
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
                    percent: ketinggianAirB / 100,
                    header: 'Ketinggian Air',
                    footer: '${ketinggianAirB.toStringAsFixed(2)} cm',
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
