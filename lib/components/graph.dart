import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graph/components/duartion_tabs.dart';
import 'package:graph/models/plot_object.dart';
import 'package:graph/config/size_config.dart';

class Graph extends StatefulWidget {
  final List<PlotObject> dataPoints;
  final GraphDuration duartion;
  final double? height;
  final double? width;
  const Graph(
      {Key? key,
      required this.dataPoints,
      required this.duartion,
      this.height,
      this.width})
      : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<DateTime> xAxisPoints = [];
  List<FlSpot> spots = [];
  @override
  void initState() {
    for (var element in widget.dataPoints) {
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(element.x.toInt());
      xAxisPoints.add(dateTime);
      spots = List.generate(
          widget.dataPoints.length,
          (index) => FlSpot(widget.dataPoints[index].x.toDouble(),
              widget.dataPoints[index].y.toDouble()));
    }
    print(spots);
    mapTimeStampToY();
    super.initState();
  }

  mapTimeStampToY() {
    var mp = widget.dataPoints.map((e) => e.x - widget.dataPoints.first.x);
    print('mp====>$mp');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.toHeight,
      // width: 200.toWidth,
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
                // print('value====$value');
                // if (value == widget.dataPoints.first.x) {
                //   return xAxisPoints.first.hour.toString();
                // }
                // if (value == widget.dataPoints.last.x) {
                //   return xAxisPoints.last.hour.toString();
                // }
                // return '';
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
              spots: spots,
              // spots: [
              //   FlSpot(0, 3),
              //   FlSpot(2.6, 2),
              //   FlSpot(4.9, 5),
              //   FlSpot(6.8, 3.1),
              //   FlSpot(8, 4),
              //   FlSpot(9.5, 3),
              //   FlSpot(11, 4),
              // ],
              // isCurved: true,
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
          // ),
          // ),
        ),
        // ),
      ),
    );
  }
}
