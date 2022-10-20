import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (double value, TitleMeta meta) {
            const style = TextStyle(
              color: Color(0xff72719b),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            );
            switch (value.toInt()) {
              case 0:
                return Text('JAN', style: style);
            /*  case 1:
                return Text('FEB', style: style);
              case 2:
                return Text('MAR', style: style);
              case 3:
                return Text('APR', style: style); */
              case 4:
                return Text('MAY', style: style);
              /*case 5:
                return Text('JUNE', style: style);
              case 6:
                return Text('JULY', style: style);
              case 7:
                return Text('AUG', style: style);*/
              case 8:
                return Text('SEPT', style: style);
/*              case 9:
                return Text('OCT', style: style);
              case 10:
                return Text('NOV', style: style);*/
              case 11:
                return Text('DEC', style: style);
            }
            return Text('', style: style);
          },
        ),),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                color: Color(0xff67727d),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              );
              switch (value.toInt()) {
                case 0:
                  return Text('1k \$', style: style);
                case 3:
                  return Text('5k \$', style: style);
                case 6:
                  return Text('10k \$', style: style);
                case 9:
                  return Text('15k \$', style: style);
                case 11:
                  return Text('20k \$', style: style);
              }
              return Text('', style: style);
            },
          ),
        ),
      );
}
