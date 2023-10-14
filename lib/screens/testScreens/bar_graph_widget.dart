import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../repositories/bar_graph_repository.dart';

class BarGraph extends StatelessWidget {
  const BarGraph(
      {super.key,
      required this.oneAmStepCount,
      required this.twoAmStepCount,
      required this.threeAmStepCount,
      required this.fourAmStepCount,
      required this.fiveAmStepCount,
      required this.sixAmStepCount,
      required this.sevenAmStepCount,
      required this.eightAmStepCount,
      required this.nineAmStepCount,
      required this.tenAmStepCount,
      required this.elevenAmStepCount,
      required this.middayStepCount,
      required this.onePmStepCount,
      required this.twoPmStepCount,
      required this.threePmStepCount,
      required this.fourPmStepCount,
      required this.fivePmStepCount,
      required this.sixPmStepCount,
      required this.sevenPmStepCount,
      required this.eightPmStepCount,
      required this.ninePmStepCount,
      required this.tenPmStepCount,
      required this.elevenPmStepCount,
      required this.midNightStepCount});

  final int oneAmStepCount;
  final int twoAmStepCount;
  final int threeAmStepCount;
  final int fourAmStepCount;
  final int fiveAmStepCount;
  final int sixAmStepCount;
  final int sevenAmStepCount;
  final int eightAmStepCount;
  final int nineAmStepCount;
  final int tenAmStepCount;
  final int elevenAmStepCount;
  final int middayStepCount;
  final int onePmStepCount;
  final int twoPmStepCount;
  final int threePmStepCount;
  final int fourPmStepCount;
  final int fivePmStepCount;
  final int sixPmStepCount;
  final int sevenPmStepCount;
  final int eightPmStepCount;
  final int ninePmStepCount;
  final int tenPmStepCount;
  final int elevenPmStepCount;
  final int midNightStepCount;

  @override
  Widget build(BuildContext context) {
    return BarDetails(
      oneAmStepCount: oneAmStepCount,
      twoAmStepCount: twoAmStepCount,
      threeAmStepCount: threeAmStepCount,
      fourAmStepCount: fourAmStepCount,
      fiveAmStepCount: fiveAmStepCount,
      sixAmStepCount: sixAmStepCount,
      sevenAmStepCount: sevenAmStepCount,
      eightAmStepCount: eightAmStepCount,
      nineAmStepCount: nineAmStepCount,
      tenAmStepCount: tenAmStepCount,
      elevenAmStepCount: elevenAmStepCount,
      middayStepCount: middayStepCount,
      //PM step
      onePmStepCount: onePmStepCount,
      twoPmStepCount: twoPmStepCount,
      threePmStepCount: threePmStepCount,
      fourPmStepCount: fourPmStepCount,
      fivePmStepCount: fivePmStepCount,
      sixPmStepCount: sixPmStepCount,
      sevenPmStepCount: sevenPmStepCount,
      eightPmStepCount: eightPmStepCount,
      ninePmStepCount: ninePmStepCount,
      tenPmStepCount: tenPmStepCount,
      elevenPmStepCount: elevenPmStepCount,
      midNightStepCount: midNightStepCount,
    );
  }
}

class BarDetails extends StatelessWidget {
  BarDetails({
    super.key,
    required this.oneAmStepCount,
    required this.twoAmStepCount,
    required this.threeAmStepCount,
    required this.fourAmStepCount,
    required this.fiveAmStepCount,
    required this.sixAmStepCount,
    required this.sevenAmStepCount,
    required this.eightAmStepCount,
    required this.nineAmStepCount,
    required this.tenAmStepCount,
    required this.elevenAmStepCount,
    required this.middayStepCount,
    required this.onePmStepCount,
    required this.twoPmStepCount,
    required this.threePmStepCount,
    required this.fourPmStepCount,
    required this.fivePmStepCount,
    required this.sixPmStepCount,
    required this.sevenPmStepCount,
    required this.eightPmStepCount,
    required this.ninePmStepCount,
    required this.tenPmStepCount,
    required this.elevenPmStepCount,
    required this.midNightStepCount,
  });

  final int oneAmStepCount;
  final int twoAmStepCount;
  final int threeAmStepCount;
  final int fourAmStepCount;
  final int fiveAmStepCount;
  final int sixAmStepCount;
  final int sevenAmStepCount;
  final int eightAmStepCount;
  final int nineAmStepCount;
  final int tenAmStepCount;
  final int elevenAmStepCount;
  final int middayStepCount;
  final int onePmStepCount;
  final int twoPmStepCount;
  final int threePmStepCount;
  final int fourPmStepCount;
  final int fivePmStepCount;
  final int sixPmStepCount;
  final int sevenPmStepCount;
  final int eightPmStepCount;
  final int ninePmStepCount;
  final int tenPmStepCount;
  final int elevenPmStepCount;
  final int midNightStepCount;

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 11,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0-3';
        break;
      case 3:
        text = '3-6';
        break;
      case 6:
        text = '6-9';
        break;
      case 9:
        text = '9-12';
        break;
      case 12:
        text = '12-15';
        break;
      case 15:
        text = '15-18';
        break;
      case 18:
        text = '18-21';
        break;
      case 21:
        text = '21-00';
      default:
        text = '';
        break;
    }
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
    List<DateTime> timePeriod = [
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 00, minute: 59).hour,
          const TimeOfDay(hour: 00, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 01, minute: 59).hour,
          const TimeOfDay(hour: 01, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 02, minute: 59).hour,
          const TimeOfDay(hour: 02, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 03, minute: 59).hour,
          const TimeOfDay(hour: 03, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 04, minute: 59).hour,
          const TimeOfDay(hour: 04, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 05, minute: 59).hour,
          const TimeOfDay(hour: 05, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 06, minute: 59).hour,
          const TimeOfDay(hour: 06, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 07, minute: 59).hour,
          const TimeOfDay(hour: 07, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 08, minute: 59).hour,
          const TimeOfDay(hour: 08, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 09, minute: 59).hour,
          const TimeOfDay(hour: 09, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 10, minute: 59).hour,
          const TimeOfDay(hour: 10, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 11, minute: 59).hour,
          const TimeOfDay(hour: 11, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 12, minute: 59).hour,
          const TimeOfDay(hour: 12, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 13, minute: 59).hour,
          const TimeOfDay(hour: 13, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 14, minute: 59).hour,
          const TimeOfDay(hour: 14, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 15, minute: 59).hour,
          const TimeOfDay(hour: 15, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 16, minute: 59).hour,
          const TimeOfDay(hour: 16, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 17, minute: 59).hour,
          const TimeOfDay(hour: 17, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 18, minute: 59).hour,
          const TimeOfDay(hour: 18, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 19, minute: 59).hour,
          const TimeOfDay(hour: 19, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 20, minute: 59).hour,
          const TimeOfDay(hour: 20, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 21, minute: 59).hour,
          const TimeOfDay(hour: 21, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 22, minute: 59).hour,
          const TimeOfDay(hour: 22, minute: 59).minute),
      DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 23, minute: 59).hour,
          const TimeOfDay(hour: 23, minute: 59).minute),
    ];
    BarData barData = BarData(
      oneAm: timePeriod[0],
      twoAm: timePeriod[1],
      threeAm: timePeriod[2],
      fourAm: timePeriod[3],
      fiveAm: timePeriod[4],
      sixAm: timePeriod[5],
      sevenAm: timePeriod[6],
      eightAm: timePeriod[7],
      nineAm: timePeriod[8],
      tenAm: timePeriod[9],
      elevenAm: timePeriod[10],
      midday: timePeriod[11],
      // PM
      onePm: timePeriod[12],
      twoPm: timePeriod[13],
      threePm: timePeriod[14],
      fourPm: timePeriod[15],
      fivePm: timePeriod[16],
      sixPm: timePeriod[17],
      sevenPm: timePeriod[18],
      eightPm: timePeriod[19],
      ninePm: timePeriod[20],
      tenPm: timePeriod[21],
      elevenPm: timePeriod[22],
      midNight: timePeriod[23],
      oneAmStepCount: oneAmStepCount,
      twoAmStepCount: twoAmStepCount,
      threeAmStepCount: threeAmStepCount,
      fourAmStepCount: fourAmStepCount,
      fiveAmStepCount: fiveAmStepCount,
      sixAmStepCount: sixAmStepCount,
      sevenAmStepCount: sevenAmStepCount,
      eightAmStepCount: eightAmStepCount,
      nineAmStepCount: nineAmStepCount,
      tenAmStepCount: tenAmStepCount,
      elevenAmStepCount: elevenAmStepCount,
      middayStepCount: middayStepCount,
      // PM
      onePmStepCount: onePmStepCount,
      twoPmStepCount: twoPmStepCount,
      threePmStepCount: threePmStepCount,
      fourPmStepCount: fourPmStepCount,
      fivePmStepCount: fivePmStepCount,
      sixPmStepCount: sixPmStepCount,
      sevenPmStepCount: sevenPmStepCount,
      eightPmStepCount: eightPmStepCount,
      ninePmStepCount: ninePmStepCount,
      tenPmStepCount: tenPmStepCount,
      elevenPmStepCount: elevenPmStepCount,
      midNightStepCount: midNightStepCount,
    );
    barData.init();

    int maxY() {
      List<int> allStepCounter = [
        oneAmStepCount,
        twoAmStepCount,
        threeAmStepCount,
        fourAmStepCount,
        fiveAmStepCount,
        sixAmStepCount,
        sevenAmStepCount,
        eightAmStepCount,
        nineAmStepCount,
        tenAmStepCount,
        elevenAmStepCount,
        middayStepCount,
        onePmStepCount,
        twoPmStepCount,
        threePmStepCount,
        fourPmStepCount,
        fivePmStepCount,
        sixPmStepCount,
        sevenPmStepCount,
        eightPmStepCount,
        ninePmStepCount,
        tenPmStepCount,
        elevenPmStepCount,
        midNightStepCount
      ];
      int? maxValue;
      for (var i = 0; i < allStepCounter.length - 1; i++) {
        maxValue = allStepCounter.first;
        if (maxValue < allStepCounter[i + 1]) {
          maxValue = allStepCounter[i + 1];
        }
      }
      return maxValue ?? 0;
    }
//TODO: BarTouchData with bloc
    return
      BarChart(BarChartData(
        // barTouchData:BarTouchData(touchCallback: (FlTouchEvent event, barTouchResponse){
        //    BarTooltipItem(
        //       'rrrr',
        //       const TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18,
        //   ));
        // }),
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
