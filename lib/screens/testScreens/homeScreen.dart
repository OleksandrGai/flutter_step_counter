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
  HealthFactory healthFactory = HealthFactory();
  int _firstSteps = 0;
  int _secondSteps = 0;
  int _thirdSteps = 0;
  int _fourthSteps = 0;

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
          const TimeOfDay(hour: 05, minute: 59).hour,
          const TimeOfDay(hour: 05, minute: 59).minute),
    ).then((value) => _firstSteps = value);
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
          const TimeOfDay(hour: 11, minute: 59).hour,
          const TimeOfDay(hour: 11, minute: 59).minute),
    ).then((value) => _secondSteps = value);
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
          const TimeOfDay(hour: 17, minute: 59).hour,
          const TimeOfDay(hour: 17, minute: 59).minute),
    ).then((value) => _thirdSteps = value);
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
          const TimeOfDay(hour: 23, minute: 59).hour,
          const TimeOfDay(hour: 23, minute: 59).minute),
    ).then((value) => _fourthSteps = value);
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
      return step!;
    } else {
      print('error some');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSucceed) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const LoginPage()));
          }
        },
        child: BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 400,
                    child: BarGraph(
                      firstStepCount: _firstSteps,
                      secondStepCount: _secondSteps,
                      thirdStepCount: _thirdSteps,
                      fourthStepCount: _fourthSteps,
                    )),
                Text(
                  (_firstSteps + _secondSteps + _thirdSteps + _fourthSteps)
                      .toString(),
                  style: TextStyle(fontSize: 45),
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
    );
  }
}
