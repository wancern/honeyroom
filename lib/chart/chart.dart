import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:honeyroom/chart/lineTitle.dart';
import 'package:honeyroom/firestore/adminData.dart';
import 'package:honeyroom/openAPI/Services.dart';
import 'package:honeyroom/openAPI/Users.dart';

class LineChartWidget extends StatefulWidget {
  LineChartWidget() : super();

  @override
  _LineChartWidget createState() => _LineChartWidget();
}

class _LineChartWidget extends State<LineChartWidget> {
  List<User> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    ReadData.readData().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_loading ? 'Loading...' : 'Users'),
        ),
        body: Container(
            color: Colors.white,
            child: LineChart(
              LineChartData(
                  gridData: FlGridData(show: true, horizontalInterval: 2),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 300000,
                  titlesData: LineTitles.getTitleData(),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        for (double i = 0; i < 10; i++)
                          FlSpot(
                              i,
                              double.parse(_users[i.toInt()]
                                  .transactionAmount
                                  .replaceAll(',', ''))),
                      ],
                      isCurved: true,
                    )
                  ]),
            )));

    //  Container(
    //     color: Colors.white,
    //     child: LineChart(
    //       LineChartData(minX: 0, maxX: 11, minY: 0, maxY: 6, lineBarsData: [
    //         LineChartBarData(spots: [
    //           //FlSpot(1, double.parse(_users[0].transactionAmount)),
    //           FlSpot(0, 1),
    //         ])
    //       ]),
    //     ));
  }

  // Widget build(BuildContext context) => LineChart(
  //       LineChartData(minX: 0, maxX: 11, minY: 0, maxY: 6, lineBarsData: [
  //         LineChartBarData(spots: [
  //           FlSpot(0, 3),
  //           FlSpot(2.6, 2),
  //           FlSpot(4.9, 2.5),
  //           FlSpot(6.8, 5),
  //         ])
  //       ]),
  //     );
}
