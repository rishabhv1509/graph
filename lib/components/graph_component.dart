import 'package:flutter/material.dart';
import 'package:graph/components/duartion_tabs.dart';
import 'package:graph/components/graph.dart';
import 'package:graph/config/size_config.dart';
import 'package:graph/models/plot_object.dart';

class GraphComponent extends StatefulWidget {
  const GraphComponent({Key? key}) : super(key: key);

  @override
  _GraphComponentState createState() => _GraphComponentState();
}

class _GraphComponentState extends State<GraphComponent> {
  GraphDuration _graphDuration = GraphDuration.daily;
  final values = [
    PlotObject(x: 1634169600000, y: -3),
    PlotObject(x: 1634173200000, y: 2),
    PlotObject(x: 1634176800000, y: 5),
    PlotObject(x: 1634180400000, y: 3.1),
    PlotObject(x: 1634184000000, y: 4),
    PlotObject(x: 1634187600000, y: 3),
    PlotObject(x: 1634191200000, y: -4),
    PlotObject(x: 1634194800000, y: 3),
    PlotObject(x: 1634198400000, y: 2),
    // PlotObject(x:14.9, y: 5),
    // PlotObject(x:16.8,  y:3.1),
    // PlotObject(x:18, y: 4),
    // PlotObject(x:19.5, y: 3),
    // PlotObject(x:21,  y:4),
    // PlotObject(x:21.3,  y:-3),
    // PlotObject(x:21.6, y: 2),
    // PlotObject(x:24.9, y: 5),
    // PlotObject(x:26.8, y: 3.1),
    // PlotObject(x:28,  y:4),
    // PlotObject(x:29.5, y: 3),
    // PlotObject(x:30,  y:4),
    // PlotObject(x:30.5, y: 3),
    // PlotObject(x:32.6, y: -2),
    // PlotObject(x:34.9, y: 5),
    // PlotObject(x:36.8,  y:3.1),
    // PlotObject(x:38,  y:4),
    // PlotObject(x:39.5, y: 3),
    // PlotObject(x:40, y: 4),
    // PlotObject(x:41.8, y: 3),
    // PlotObject(x:42.6,  y:-2),
    // PlotObject(x:44.9, y: 5),
    // PlotObject(x:46.8,  y:3.1),
    // PlotObject(x:48, y: 4),
    // PlotObject(x:49.5, y: 3),
    // PlotObject(x:50.3,  y:4),
    // PlotObject(x:51,  y:3),
    // PlotObject(x:52.6, y: 2),
    // PlotObject(x:54.9, y: 5),
    // PlotObject(x:56.8, y: 3.1),
    // PlotObject(x:58,  y:4),
    // PlotObject(x:59.5, y: 3),
    // PlotObject(x:60.7, y: 4),
    // PlotObject(x:61.7, y: 3),
    // PlotObject(x:62.6, y: 2),
    // PlotObject(x:64.9, y: 5),
    // PlotObject(x:66.8, y: 3.1),
    // PlotObject(x:68, y: 4),
    // PlotObject(x:69.5, y: 3),
    // PlotObject(x:70.2, y: 4),
    // PlotObject(x:71.8, y: 3),
    // PlotObject(x:72.6, y: 2),
    // PlotObject(x:74.9, y: 5),
    // PlotObject(x:76.8 ,y: 3.1),
    // PlotObject(x:78, y: 4),
    // PlotObject(x:79.5,  y:3),
    // PlotObject(x:80, y: 4),
    // PlotObject(x:81,  y:3),
    // PlotObject(x:82.6, y: 2),
    // PlotObject(x:84.9, y: 5),
    // PlotObject(x:86.8, y: 3.1),
    // PlotObject(x:88, y: 4),
    // PlotObject(x:89.5, y: 3),
    // PlotObject(x:90, y: 4),
    // PlotObject(x:90.8, y: 3),
    // PlotObject(x:92.6,  y:2),
    // PlotObject(x:94.9,  y:5),
    // PlotObject(x:96.8, y: 3.1),
    // PlotObject(x:98, y: 4),
    // PlotObject(x:99.5, y: 3),
    // PlotObject(x:101,  y:4),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.toHeight),
          border:
              Border.all(color: const Color(0xff3B3C43), width: 1.toHeight)),
      width: 674.toWidth,
      height: 268.toHeight,
      padding: EdgeInsets.all(2.toHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xff0A080F),
                  height: 44.toHeight,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 100.toWidth,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'PRICES',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.toFont),
                                  ),
                                  Container(
                                    height: 5.toHeight,
                                    width: 60.toHeight,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20.toWidth,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'PRICES',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.toFont),
                                  ),
                                  Container(
                                    height: 5.toHeight,
                                    width: 60.toHeight,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          )),
                      DurationTabs(
                        graphDuration: (s) {
                          print(s);
                          setState(() {
                            _graphDuration = s;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Graph(dataPoints: values, duartion: _graphDuration))
        ],
      ),
    );
  }
}
