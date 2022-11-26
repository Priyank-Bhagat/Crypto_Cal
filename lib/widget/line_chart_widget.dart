import 'package:crypto_calc/Screens/line_titles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "data",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        LineChart(LineChartData(
            titlesData: LineTitles.getTitleData(),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 20,
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 0),
                  FlSpot(2.6, 5),
                  FlSpot(4.9, 1),
                  FlSpot(6.8, 2),
                  FlSpot(8, 0),
                  FlSpot(9.5, 2),
                  FlSpot(11, 1.2),
                ],
                dotData: FlDotData(show: false),
                isCurved: true,
                color: Color(0xff23b6e6),
                barWidth: 4,
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0xff02d39a).withOpacity(0.3),
                ),
              ),
            ])),
      ],
    );
  }
}
