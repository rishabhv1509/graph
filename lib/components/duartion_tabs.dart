import 'package:flutter/material.dart';

import 'package:graph/config/size_config.dart';

class DurationTabs extends StatefulWidget {
  final ValueChanged<GraphDuration>? graphDuration;
  const DurationTabs({
    Key? key,
    this.graphDuration,
  }) : super(key: key);

  @override
  _DurationTabsState createState() => _DurationTabsState();
}

class _DurationTabsState extends State<DurationTabs> {
  final duartionList = ['1D', '7D', '1M', '3M', '6M', '1Y', 'ALL'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        duartionList.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.toWidth),
          child: GestureDetector(
            onTap: () {
              setState(() {
                switch (index) {
                  case 0:
                    widget.graphDuration!(GraphDuration.daily);
                    break;
                  case 1:
                    widget.graphDuration!(GraphDuration.weekly);
                    break;
                  case 2:
                    widget.graphDuration!(GraphDuration.monthly);
                    break;
                  case 3:
                    widget.graphDuration!(GraphDuration.triMonthly);
                    break;
                  case 4:
                    widget.graphDuration!(GraphDuration.halyYearly);
                    break;
                  case 5:
                    widget.graphDuration!(GraphDuration.yearly);
                    break;
                  case 6:
                    widget.graphDuration!(GraphDuration.all);
                    break;
                  default:
                }
              });
            },
            child: Text(
              duartionList[index],
              style: TextStyle(color: Colors.white, fontSize: 10.toFont),
            ),
          ),
        ),
      ),
    );
  }
}

enum GraphDuration {
  daily,
  weekly,
  monthly,
  triMonthly,
  halyYearly,
  yearly,
  all
}
