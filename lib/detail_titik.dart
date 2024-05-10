import 'package:flutter/material.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';
import 'homepage.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DetailTitik extends StatelessWidget {
  const DetailTitik({Key? key}) : super(key: key);

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
                                  maximum: 100,
                                  interval: 25,
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                      value: 70,
                                      needleEndWidth: 5,
                                      )
                                  ],
                                  labelsPosition: ElementsPosition.outside,
                                  ranges: <GaugeRange>[
                                    GaugeRange(startValue: 0, endValue: 100, color: Colors.blue,)
                                  ],
                                  
                                )
                              ],
                              ),
                  ),
                  VerticalBarIndicator(
                    percent: 0.70,
                    header: 'Ketinggian Air',
                    footer: '0,70 meter',
                    height: 150,
                    width: 250,
                    color: [
                      Colors.blue.withOpacity(0.5),
                      Colors.blue,
                    ],
                    circularRadius: 0,
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide.none,
                      ),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Center(
                                    child: Text(
                                  'Kecepatan Aliran',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Center(child: Text('70 m/s2')),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Center(
                                    child: Text(
                                  'Ketinggian Air',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Center(child: Text('0,70 m')),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
