import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final values = [
    FlSpot(0, -3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 3.1),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, -4),
    FlSpot(12, 3),
    FlSpot(12.6, 2),
    FlSpot(14.9, 5),
    FlSpot(16.8, 3.1),
    FlSpot(18, 4),
    FlSpot(19.5, 3),
    FlSpot(21, 4),
    FlSpot(21.3, -3),
    FlSpot(21.6, 2),
    FlSpot(24.9, 5),
    FlSpot(26.8, 3.1),
    FlSpot(28, 4),
    FlSpot(29.5, 3),
    FlSpot(30, 4),
    FlSpot(30.5, 3),
    FlSpot(32.6, -2),
    FlSpot(34.9, 5),
    FlSpot(36.8, 3.1),
    FlSpot(38, 4),
    FlSpot(39.5, 3),
    FlSpot(40, 4),
    FlSpot(41.8, 3),
    FlSpot(42.6, -2),
    FlSpot(44.9, 5),
    FlSpot(46.8, 3.1),
    FlSpot(48, 4),
    FlSpot(49.5, 3),
    FlSpot(50.3, 4),
    FlSpot(51, 3),
    FlSpot(52.6, 2),
    FlSpot(54.9, 5),
    FlSpot(56.8, 3.1),
    FlSpot(58, 4),
    FlSpot(59.5, 3),
    FlSpot(60.7, 4),
    FlSpot(61.7, 3),
    FlSpot(62.6, 2),
    FlSpot(64.9, 5),
    FlSpot(66.8, 3.1),
    FlSpot(68, 4),
    FlSpot(69.5, 3),
    FlSpot(70.2, 4),
    FlSpot(71.8, 3),
    FlSpot(72.6, 2),
    FlSpot(74.9, 5),
    FlSpot(76.8, 3.1),
    FlSpot(78, 4),
    FlSpot(79.5, 3),
    FlSpot(80, 4),
    FlSpot(81, 3),
    FlSpot(82.6, 2),
    FlSpot(84.9, 5),
    FlSpot(86.8, 3.1),
    FlSpot(88, 4),
    FlSpot(89.5, 3),
    FlSpot(90, 4),
    FlSpot(90.8, 3),
    FlSpot(92.6, 2),
    FlSpot(94.9, 5),
    FlSpot(96.8, 3.1),
    FlSpot(98, 4),
    FlSpot(99.5, 3),
    FlSpot(101, 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: 450,
            height: 200,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(enabled: true),

                // gridData: FlGridData(
                //   show: true,
                //   drawVerticalLine: true,
                //   getDrawingHorizontalLine: (value) {
                //     return FlLine(
                //       color: const Color(0xff37434d),
                //       strokeWidth: 1,
                //     );
                //   },
                //   getDrawingVerticalLine: (value) {
                //     return FlLine(
                //       color: const Color(0xff37434d),
                //       strokeWidth: 1,
                //     );
                //   },
                // ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    // reservedSize: 22,
                    // interval: 1,
                    getTextStyles: (context, value) => const TextStyle(
                        color: Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return 'MAR';
                        case 5:
                          return 'JUN';
                        case 8:
                          return 'SEP';
                      }
                      return '';
                    },
                    // margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return '10';
                        case 3:
                          return '30';
                        case 5:
                          return '50';
                        case -4:
                          return '-4';
                      }
                      return '';
                    },
                    reservedSize: 32,
                    margin: 12,
                  ),
                ),

                // borderData: FlBorderData(
                //     show: true,
                //     border: Border.all(
                //         color: const Color(0xff37434d), width: 1)),
                minX: 0,
                // maxX: 11,
                minY: -4,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: values,
                    // spots: [
                    //   FlSpot(0, 3),
                    //   FlSpot(2.6, 2),
                    //   FlSpot(4.9, 5),
                    //   FlSpot(6.8, 3.1),
                    //   FlSpot(8, 4),
                    //   FlSpot(9.5, 3),
                    //   FlSpot(11, 4),
                    // ],
                    isCurved: true,
                    // colors: gradientColors,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      // colors: gradientColors
                      //     .map((color) => color.withOpacity(0.3))
                      //     .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
