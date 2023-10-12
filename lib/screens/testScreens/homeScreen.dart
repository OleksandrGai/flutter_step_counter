import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_state.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';

import '../../auth/logout_bloc/logout_event.dart';
import 'package:health/health.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchStepData();
  }
  int _getSteps = 0;
  HealthFactory healthFactory = HealthFactory();

  Future fetchStepData() async {
    int? step;
    var types = [HealthDataType.STEPS];
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    var permission = [HealthDataAccess.READ];
    bool requested = await healthFactory
        .requestAuthorization(types,permissions: permission);
    if (requested) {
      try {
        step = await healthFactory.getTotalStepsInInterval(midnight, now);
      } catch (e) {
        print(e);
      }
      print('Total number os steps: $step');
      setState(() {
        _getSteps = (step == null) ? 0 : step;
      });
    } else{
      print('error some');
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
                Text(_getSteps.toString(),style: TextStyle(fontSize: 45),),
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
