import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

class DetailTitik extends StatelessWidget {
  final String title;

  const DetailTitik({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 7,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              'Tungkop, Darussalam',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       '14.10',
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              padding: EdgeInsets.all(10),
              child: KdGaugeView(
                minSpeed: 0,
                maxSpeed: 100, 
                speed: 70, 
                animate: true,
                duration: Duration(seconds: 3),
                alertSpeedArray: [20, 50, 80],
                alertColorArray: [Colors.green, Colors.orange, Colors.red],
                unitOfMeasurement: "m/s2",
              ),
            ),
            // const SizedBox(height: 10), // Add some spacing
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
            
            const SizedBox(height: 20), // Add some spacing
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
                          child: Center(child: Text('Kecepatan Aliran', style: TextStyle(fontWeight: FontWeight.bold),)),
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
                          child: Center(child: Text('Ketinggian Air', style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Center(child: Text('0,67 m')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back to Main',
        child: Icon(Icons.place),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
