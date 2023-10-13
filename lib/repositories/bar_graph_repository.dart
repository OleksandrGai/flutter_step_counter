class GraphCoordinateSystem {
  GraphCoordinateSystem({required this.x, required this.y});

  final int x;
  final int y;
}

class BarData {
  BarData({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.firstStepCount,
    required this.secondStepCount,
    required this.thirdStepCount,
    required this.fourthStepCount,

  });

  final int first;
  final int second;
  final int third;
  final int fourth;

  final int firstStepCount;
  final int secondStepCount;
  final int thirdStepCount;
  final int fourthStepCount;

  List<GraphCoordinateSystem> barData = [];

  void init() {
    barData = [
      GraphCoordinateSystem(x: first, y: firstStepCount),
      GraphCoordinateSystem(x: second, y: secondStepCount),
      GraphCoordinateSystem(x: third, y: thirdStepCount),
      GraphCoordinateSystem(x: fourth, y: fourthStepCount),
    ];
  }
}
