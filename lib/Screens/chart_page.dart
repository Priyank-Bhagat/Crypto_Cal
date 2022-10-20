import 'package:flutter/material.dart';

import '../widget/line_chart_widget.dart';

class ChartPage extends StatelessWidget {

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: const Color(0xff020227),
        child: Padding(
          padding:  EdgeInsets.only(top: deviceHeight(context)*.2),
          child: LineChartWidget(),
        ),
      );
}
