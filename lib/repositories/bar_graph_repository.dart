class GraphCoordinateSystem {
  GraphCoordinateSystem({required this.x, required this.y});

  final DateTime x;
  final int y;
}

class BarData {
  BarData({
    required this.oneAm,
    required this.twoAm,
    required this.threeAm,
    required this.fourAm,
    required this.fiveAm,
    required this.sixAm,
    required this.sevenAm,
    required this.eightAm,
    required this.nineAm,
    required this.tenAm,
    required this.elevenAm,
    required this.midday,
    required this.onePm,
    required this.twoPm,
    required this.threePm,
    required this.fourPm,
    required this.fivePm,
    required this.sixPm,
    required this.sevenPm,
    required this.eightPm,
    required this.ninePm,
    required this.tenPm,
    required this.elevenPm,
    required this.midNight,

    // sepCount
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

  final DateTime oneAm;
  final DateTime twoAm;
  final DateTime threeAm;
  final DateTime fourAm;
  final DateTime fiveAm;
  final DateTime sixAm;
  final DateTime sevenAm;
  final DateTime eightAm;
  final DateTime nineAm;
  final DateTime tenAm;
  final DateTime elevenAm;
  final DateTime midday;

  final DateTime onePm;
  final DateTime twoPm;
  final DateTime threePm;
  final DateTime fourPm;
  final DateTime fivePm;
  final DateTime sixPm;
  final DateTime sevenPm;
  final DateTime eightPm;
  final DateTime ninePm;
  final DateTime tenPm;
  final DateTime elevenPm;
  final DateTime midNight;

  // sepCount
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

  List<GraphCoordinateSystem> barData = [];

  void init() {
    barData = [
      GraphCoordinateSystem(x: oneAm, y: oneAmStepCount),
      GraphCoordinateSystem(x: twoAm, y: twoAmStepCount),
      GraphCoordinateSystem(x: threeAm, y: threeAmStepCount),
      GraphCoordinateSystem(x: fourAm, y: fourAmStepCount),
      GraphCoordinateSystem(x: fiveAm, y: fiveAmStepCount),
      GraphCoordinateSystem(x: sixAm, y: sixAmStepCount),
      GraphCoordinateSystem(x: sevenAm, y: sevenAmStepCount),
      GraphCoordinateSystem(x: eightAm, y: eightAmStepCount),
      GraphCoordinateSystem(x: nineAm, y: nineAmStepCount),
      GraphCoordinateSystem(x: tenAm, y: tenAmStepCount),
      GraphCoordinateSystem(x: elevenAm, y: elevenAmStepCount),
      GraphCoordinateSystem(x: midday, y: middayStepCount),
      GraphCoordinateSystem(x: onePm, y: onePmStepCount),
      GraphCoordinateSystem(x: twoPm, y: twoPmStepCount),
      GraphCoordinateSystem(x: threePm, y: threePmStepCount),
      GraphCoordinateSystem(x: fourPm, y: fourPmStepCount),
      GraphCoordinateSystem(x: fivePm, y: fivePmStepCount),
      GraphCoordinateSystem(x: sixPm, y: sixPmStepCount),
      GraphCoordinateSystem(x: sevenPm, y: sevenPmStepCount),
      GraphCoordinateSystem(x: eightPm, y: eightPmStepCount),
      GraphCoordinateSystem(x: ninePm, y: ninePmStepCount),
      GraphCoordinateSystem(x: tenPm, y: tenPmStepCount),
      GraphCoordinateSystem(x: elevenPm, y: elevenPmStepCount),
      GraphCoordinateSystem(x: midNight, y: midNightStepCount),
    ];
  }
}
