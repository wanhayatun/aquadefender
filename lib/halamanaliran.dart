import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'detail_titik.dart';
import 'detail_titik2.dart'; // Pastikan file detail_titik2.dart ada di lokasi yang benar

class HalamanAliran extends StatefulWidget {
  const HalamanAliran({Key? key}) : super(key: key);

  @override
  _HalamanAliranState createState() => _HalamanAliranState();
}

class _HalamanAliranState extends State<HalamanAliran> {
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
                    padding: const EdgeInsets.only(right: 150),
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
                            child: KdGaugeView(
                              minSpeed: 0,
                              maxSpeed: 100,
                              speed: 70,
                              animate: true,
                              duration: Duration(seconds: 5),
                              alertSpeedArray: [20, 50, 80],
                              alertColorArray: [
                                Colors.green,
                                Colors.orange,
                                Colors.red
                              ],
                              unitOfMeasurement: "",
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'm/s2',
                            style: TextStyle(
                              fontSize: 20,
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
                            child: KdGaugeView(
                              minSpeed: 0,
                              maxSpeed: 100,
                              speed: 50,
                              animate: true,
                              duration: Duration(seconds: 5),
                              alertSpeedArray: [20, 50, 80],
                              alertColorArray: [
                                Colors.green,
                                Colors.orange,
                                Colors.red
                              ],
                              unitOfMeasurement: "",
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'm/s2',
                            style: TextStyle(
                              fontSize: 20,
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
          SizedBox(height: 2),
          VerticalBarIndicator(
            percent: 0.67,
            header: 'Ketinggian Air',
            footer: '0,67 meter',
            height: 200,
            width: 350,
            color: [
              Colors.blue.withOpacity(0.5),
              Colors.blue,
            ],
            circularRadius: 0,
          ),
          SizedBox(height: 20),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(child: Center(child: Text(''))),
                  TableCell(child: Center(child: Text('A'))),
                  TableCell(child: Center(child: Text('B'))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Kecepatan (m/s2)'))),
                  TableCell(child: Center(child: Text('70 m/s2'))),
                  TableCell(child: Center(child: Text('50 m/s2'))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text('Ketinggian (meter)'))),
                  TableCell(child: Center(child: Text('0.70 m'))),
                  TableCell(child: Center(child: Text('0.50 m'))),
                ],
              ),
              // Tambahkan baris tabel sesuai dengan data ketinggian air dari database
            ],
          ),
        ],
      ),
      // Hapus floatingActionButton
    );
  }
}