import 'package:health/health.dart';

class StepRepository {
  HealthFactory healthFactory = HealthFactory();
  final _now = DateTime.now();

  StepRepository();

  Future<int> _fetchStepData({
    List<HealthDataType> types = const [HealthDataType.STEPS],
    List<HealthDataAccess> permission = const [HealthDataAccess.READ],
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    int? step;
    bool requested = await healthFactory.requestAuthorization(types,
        permissions: permission);
    if (requested) {
      try {
        step = await healthFactory.getTotalStepsInInterval(startTime, endTime);
      } catch (e) {
        print(e);
      }
      print('Total number os steps: $step');
      return step ?? 0;
    } else {
      //   print('error some');
      return 0;
    }
  }

  Future<List<int>> initStepData() async {
    List<int> step = [];
    for (var hour = 0; hour < 24; hour++) {
      DateTime startTime =
          DateTime(_now.year, _now.month, _now.day, hour, 00, 00);
      DateTime endTime =
          DateTime(_now.year, _now.month, _now.day, hour, 59, 59);
      step.add(await _fetchStepData(startTime: startTime, endTime: endTime));
    }
    return step;
  }
}
