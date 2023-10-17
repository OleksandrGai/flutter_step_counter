import 'package:health/health.dart';

class StepRepository {
  HealthFactory healthFactory = HealthFactory();

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
      // print('Total number os steps: $step');
      return step ?? 0;
    } else {
      //   print('error some');
      return 0;
    }
  }

  Future<List<int>> initStepData() async {
    List<int> step = [];
    final now = DateTime.now();
    for (var hour = 0; hour < 24; hour++) {
      DateTime startTime = DateTime(now.year, now.month, now.day, hour, 00, 00);
      DateTime endTime = DateTime(now.year, now.month, now.day, hour, 59, 59);
      step.add(await _fetchStepData(startTime: startTime, endTime: endTime));
    }
    return step;
  }

  Future<int> totalSteps() async {
    List<int> steps;
    int totalSteps = 0;
    steps = await initStepData();
    for (int step in steps) {
      totalSteps += step;
    }
    return totalSteps;
  }
}
