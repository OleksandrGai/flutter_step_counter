import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_state.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';

import '../../auth/logout_bloc/logout_event.dart';
import 'package:health/health.dart';
import 'bar_graph_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<HomeScreen> {
  final now = DateTime.now();
  final tomorrow = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  HealthFactory healthFactory = HealthFactory();
  int _firstSteps = 0;
  int _secondSteps = 0;
  int _thirdSteps = 0;
  int _fourthSteps = 0;
  int _fiveSteps = 0;
  int _sixSteps = 0;
  int _sevenSteps = 0;
  int _eightSteps = 0;
  int _nineSteps = 0;
  int _tenSteps = 0;
  int _elevenSteps = 0;
  int _middaySteps = 0;
  int _firstPmSteps = 0;
  int _secondPmSteps = 0;
  int _thirdPmSteps = 0;
  int _fourthPmSteps = 0;
  int _fivePmSteps = 0;
  int _sixPmSteps = 0;
  int _sevenPmSteps = 0;
  int _eightPmSteps = 0;
  int _ninePmSteps = 0;
  int _tenPmSteps = 0;
  int _elevenPmSteps = 0;
  int _midNightSteps = 0;

  @override
  void initState() {
    super.initState();
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 00, minute: 00).hour,
          const TimeOfDay(hour: 00, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 00, minute: 59).hour,
          const TimeOfDay(hour: 00, minute: 59).minute),
    ).then((value) => _firstSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 01, minute: 00).hour,
          const TimeOfDay(hour: 01, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 01, minute: 59).hour,
          const TimeOfDay(hour: 01, minute: 59).minute),
    ).then((value) => _secondSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 02, minute: 00).hour,
          const TimeOfDay(hour: 02, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 02, minute: 59).hour,
          const TimeOfDay(hour: 02, minute: 59).minute),
    ).then((value) => _thirdSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 03, minute: 00).hour,
          const TimeOfDay(hour: 03, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 03, minute: 59).hour,
          const TimeOfDay(hour: 03, minute: 59).minute),
    ).then((value) => _fourthSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 04, minute: 00).hour,
          const TimeOfDay(hour: 04, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 04, minute: 59).hour,
          const TimeOfDay(hour: 04, minute: 59).minute),
    ).then((value) => _fiveSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 05, minute: 00).hour,
          const TimeOfDay(hour: 05, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 05, minute: 59).hour,
          const TimeOfDay(hour: 05, minute: 59).minute),
    ).then((value) => _sixSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 06, minute: 00).hour,
          const TimeOfDay(hour: 06, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 06, minute: 59).hour,
          const TimeOfDay(hour: 06, minute: 59).minute),
    ).then((value) => _sevenSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 07, minute: 00).hour,
          const TimeOfDay(hour: 07, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 07, minute: 59).hour,
          const TimeOfDay(hour: 07, minute: 59).minute),
    ).then((value) => _eightSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 08, minute: 00).hour,
          const TimeOfDay(hour: 08, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 08, minute: 59).hour,
          const TimeOfDay(hour: 08, minute: 59).minute),
    ).then((value) => _nineSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 09, minute: 00).hour,
          const TimeOfDay(hour: 09, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 09, minute: 59).hour,
          const TimeOfDay(hour: 09, minute: 59).minute),
    ).then((value) => _tenSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 10, minute: 00).hour,
          const TimeOfDay(hour: 10, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 10, minute: 59).hour,
          const TimeOfDay(hour: 10, minute: 59).minute),
    ).then((value) => _elevenSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 11, minute: 00).hour,
          const TimeOfDay(hour: 11, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 11, minute: 59).hour,
          const TimeOfDay(hour: 11, minute: 59).minute),
    ).then((value) => _middaySteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 12, minute: 00).hour,
          const TimeOfDay(hour: 12, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 12, minute: 59).hour,
          const TimeOfDay(hour: 12, minute: 59).minute),
    ).then((value) => _firstPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 13, minute: 00).hour,
          const TimeOfDay(hour: 13, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 13, minute: 59).hour,
          const TimeOfDay(hour: 13, minute: 59).minute),
    ).then((value) => _secondPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 14, minute: 00).hour,
          const TimeOfDay(hour: 14, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 14, minute: 59).hour,
          const TimeOfDay(hour: 14, minute: 59).minute),
    ).then((value) => _thirdPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 15, minute: 00).hour,
          const TimeOfDay(hour: 15, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 15, minute: 59).hour,
          const TimeOfDay(hour: 15, minute: 59).minute),
    ).then((value) => _fourthPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 16, minute: 00).hour,
          const TimeOfDay(hour: 16, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 16, minute: 59).hour,
          const TimeOfDay(hour: 16, minute: 59).minute),
    ).then((value) => _fivePmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 17, minute: 00).hour,
          const TimeOfDay(hour: 17, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 17, minute: 59).hour,
          const TimeOfDay(hour: 17, minute: 59).minute),
    ).then((value) => _sixPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 18, minute: 00).hour,
          const TimeOfDay(hour: 18, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 18, minute: 59).hour,
          const TimeOfDay(hour: 18, minute: 59).minute),
    ).then((value) => _sevenPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 19, minute: 00).hour,
          const TimeOfDay(hour: 19, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 19, minute: 59).hour,
          const TimeOfDay(hour: 19, minute: 59).minute),
    ).then((value) => _eightPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 20, minute: 00).hour,
          const TimeOfDay(hour: 20, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 20, minute: 59).hour,
          const TimeOfDay(hour: 20, minute: 59).minute),
    ).then((value) => _ninePmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 21, minute: 00).hour,
          const TimeOfDay(hour: 21, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 21, minute: 59).hour,
          const TimeOfDay(hour: 21, minute: 59).minute),
    ).then((value) => _tenPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 22, minute: 00).hour,
          const TimeOfDay(hour: 22, minute: 00).minute),
      endTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 22, minute: 59).hour,
          const TimeOfDay(hour: 22, minute: 59).minute),
    ).then((value) => _elevenPmSteps = value);
    fetchStepData(
      startTime: DateTime(
          now.year,
          now.month,
          now.day,
          const TimeOfDay(hour: 23, minute: 00).hour,
          const TimeOfDay(hour: 23, minute: 00).minute),
      endTime: DateTime(
          tomorrow.year,
          tomorrow.month,
          tomorrow.day,
          const TimeOfDay(hour: 00, minute: 00).hour,
          const TimeOfDay(hour: 00, minute: 00).minute),
    ).then((value) => _midNightSteps = value);
  }

  Future<int> fetchStepData({
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
      print('error some');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Today: ${now.year}-${now.month}-${now.day}', style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
      body: SafeArea(
        child: BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSucceed) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            }
          },
          child:
              BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Flexible(
                    child: BarGraph(
                      oneAmStepCount: _firstSteps,
                      twoAmStepCount: _secondSteps,
                      threeAmStepCount: _thirdSteps,
                      fourAmStepCount: _fourthSteps,
                      fiveAmStepCount: _fiveSteps,
                      sixAmStepCount: _sixSteps,
                      sevenAmStepCount: _sevenSteps,
                      eightAmStepCount: _eightSteps,
                      nineAmStepCount: _nineSteps,
                      tenAmStepCount: _tenSteps,
                      elevenAmStepCount: _elevenSteps,
                      middayStepCount: _middaySteps,
                      // PM
                      onePmStepCount: _firstPmSteps,
                      twoPmStepCount: _secondPmSteps,
                      threePmStepCount: _thirdPmSteps,
                      fourPmStepCount: _fourthPmSteps,
                      fivePmStepCount: _fivePmSteps,
                      sixPmStepCount: _sixPmSteps,
                      sevenPmStepCount: _sevenPmSteps,
                      eightPmStepCount: _eightPmSteps,
                      ninePmStepCount: _ninePmSteps,
                      tenPmStepCount: _tenPmSteps,
                      elevenPmStepCount: _elevenPmSteps,
                      midNightStepCount: _midNightSteps,
                    ),
                  ),
                  Text(
                    ('Total ${_firstSteps + _secondSteps + _thirdSteps + _fourthSteps + _fiveSteps + _sixSteps + _sevenSteps + _eightSteps + _nineSteps + _tenSteps + _elevenSteps + _midNightSteps} steps')
                        .toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<LogoutBloc>().add(LogoutButtonPressed());
                      },
                      child: Text('Log out'))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
