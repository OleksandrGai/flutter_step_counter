import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../repositories/bar_graph_repository.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
    required this.firstStepCount,
    required this.secondStepCount,
    required this.thirdStepCount,
    required this.fourthStepCount,
  });

  final int firstStepCount;
  final int secondStepCount;
  final int thirdStepCount;
  final int fourthStepCount;

  @override
  Widget build(BuildContext context) {
    List<int> timePeriod = [00, 06, 12, 18, 00];
    BarData barData = BarData(
      first: timePeriod[0],
      second: timePeriod[1],
      third: timePeriod[2],
      fourth: timePeriod[3],
      firstStepCount: firstStepCount,
      secondStepCount: secondStepCount,
      thirdStepCount: thirdStepCount,
      fourthStepCount: fourthStepCount,
    );
    barData.init();
    return BarChart(BarChartData(
        maxY: 200,
        minY: 0,
        barGroups: barData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y.toDouble(),
                      color: Colors.grey[400],
                      width: 23,
                      borderRadius: BorderRadius.circular(6))
                ]))
            .toList()));
  }
}
