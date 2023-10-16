class GraphCoordinateSystem {
  GraphCoordinateSystem({required this.x, required this.y});

  final DateTime x;
  final int y;
}

class BarData {
  BarData({
    required this.dateTime,
    required this.stepCount,
  });

  List<DateTime> dateTime;

  List<int> stepCount;
  List<GraphCoordinateSystem> barData = [];

  void init() {
    if (dateTime.isNotEmpty &&
        stepCount.isNotEmpty &&
        dateTime.length == stepCount.length) {
      try {
        for (var hour = 0; hour < dateTime.length; hour++) {
          barData.add(
              GraphCoordinateSystem(x: dateTime[hour], y: stepCount[hour]));
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
