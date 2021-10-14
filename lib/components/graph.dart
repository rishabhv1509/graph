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
  final bool showLabels;
  const Graph(
      {Key? key,
      required this.dataPoints,
      required this.duartion,
      this.height,
      this.width,
      this.showLabels = true})
      : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<FlSpot> spots = [];
  Map<int, DateTime> xLabels = {};
  Map<int, int> yLabels = {};
  List yCoordinateList = [];
  @override
  void initState() {
    mapTimeStampToY();
    generateSpots();
    super.initState();
  }

  getXAxisLabels() {
    DateTime first, last, mid;
    first =
        DateTime.fromMillisecondsSinceEpoch(widget.dataPoints.first.x.toInt());
    last =
        DateTime.fromMillisecondsSinceEpoch(widget.dataPoints.last.x.toInt());
    mid = DateTime.fromMillisecondsSinceEpoch(
        widget.dataPoints[(widget.dataPoints.length / 2).floor()].x.toInt());
    xLabels[0] = first;
    xLabels[(widget.dataPoints.length / 2).floor()] = mid;
    xLabels[widget.dataPoints.length - 1] = last;
  }

  generateSpots() {
    spots = List.generate(
        widget.dataPoints.length,
        (index) => FlSpot(
              yCoordinateList[index].toDouble(),
              widget.dataPoints[index].y.toDouble(),
            ));
    print(spots);
  }

  mapTimeStampToY() {
    if (widget.duartion == GraphDuration.daily) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 3600000).floor())
          .toList();

      getXAxisLabels();
    } else if (widget.duartion == GraphDuration.monthly) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 2592000000).floor())
          .toList();

      getXAxisLabels();
    } else if (widget.duartion == GraphDuration.weekly) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 604800000).floor())
          .toList();

      getXAxisLabels();
    } else if (widget.duartion == GraphDuration.triMonthly) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 7948800000).floor())
          .toList();

      getXAxisLabels();
    } else if (widget.duartion == GraphDuration.halyYearly) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 13046400000).floor())
          .toList();

      getXAxisLabels();
    } else if (widget.duartion == GraphDuration.yearly) {
      widget.dataPoints.sort((a, b) => a.x.compareTo(b.x));
      yCoordinateList = widget.dataPoints
          .map((e) => ((e.x - widget.dataPoints.first.x) / 13046400000).floor())
          .toList();

      getXAxisLabels();
    }
  }

  mapXAxisLabels(val) {
    xLabels = {};
    if (widget.duartion == GraphDuration.daily) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.hour.toString();
      } else {
        return '';
      }
    } else if (widget.duartion == GraphDuration.weekly) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.day.toString();
      } else {
        return '';
      }
    } else if (widget.duartion == GraphDuration.monthly) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.month.toString();
      } else {
        return '';
      }
    } else if (widget.duartion == GraphDuration.triMonthly) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.month.toString();
      } else {
        return '';
      }
    } else if (widget.duartion == GraphDuration.halyYearly) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.month.toString();
      } else {
        return '';
      }
    } else if (widget.duartion == GraphDuration.yearly) {
      if (xLabels.containsKey(val)) {
        return xLabels[val]!.year.toString();
      } else {
        return '';
      }
    }
  }

  mapYAxisLabels(value) {}

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
            show: widget.showLabels,
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
                return mapXAxisLabels(value);
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
