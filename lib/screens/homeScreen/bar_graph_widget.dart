import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'bar_graph_data.dart';

class BarGraph extends StatelessWidget {
  BarGraph({
    super.key,
    required this.stepCount,
  });

  List<int> stepCount;

  @override
  Widget build(BuildContext context) {
    return BarDetails(
      stepCount: stepCount,
    );
  }
}

class BarDetails extends StatelessWidget {
  BarDetails({
    super.key,
    required this.stepCount,
  });

  List<int> stepCount;
  final now = DateTime.now();

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.grey[100],
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 10,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              'Total\n',
              const TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.left,
              children: [
                TextSpan(
                  text: '${rod.toY.round()} ',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                const TextSpan(
                  text: 'steps\n',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text:
                      '${now.day}.${now.month}.,${group.x.toString()}-${(group.x + 1).toString()}',
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 11,
    );
    String text;
    var mapTime = {
      0: '00-AM',
      6: '06',
      12: '12-PM',
      18: '18',
    };
    text = mapTime[value.toInt()] ?? ' ';

    return SideTitleWidget(
      axisSide: AxisSide.top,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    List<DateTime> timePeriod = [];

    for (int hour = 0; hour < 24; hour++) {
      DateTime time = DateTime(now.year, now.month, now.day, hour, 59, 59);
      timePeriod.add(time);
    }
    BarData barData = BarData(dateTime: timePeriod, stepCount: stepCount);
    barData.init();

    int maxY() {
      List<int> allStepCounter = stepCount;
      int? maxValue;
      for (var i = 0; i < allStepCounter.length - 1; i++) {
        int first = allStepCounter[i];
        int second = allStepCounter[i + 1];
        if (first > second) {
          allStepCounter[i + 1] = first;
          maxValue = allStepCounter[i + 1];
        }
      }
      return maxValue ?? 0;
    }
    return BarChart(BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        maxY: (maxY() + 400).toDouble(),
        minY: 0,
        barGroups: barData.barData
            .map((data) => BarChartGroupData(x: data.x.hour, barRods: [
                  BarChartRodData(
                      toY: data.y.toDouble(),
                      color: Colors.deepOrange,
                      width: 15,
                      borderRadius: BorderRadius.circular(2))
                ]))
            .toList()));
  }
}
