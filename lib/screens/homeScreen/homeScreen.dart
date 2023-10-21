import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_state.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';
import 'package:flutter_step_counter/step/step_bloc/step_bloc.dart';

import '../../auth/logout_bloc/logout_event.dart';
import '../../repositories/step_repository.dart';
import '../achievement_screen/achievement_screen.dart';
import 'bar_graph_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<HomeScreen> {
  final now = DateTime.now();
  StepRepository stepRepository = StepRepository();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSucceed) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginPage()));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Today: ${now.year}-${now.month}-${now.day}',
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(LogoutButtonPressed());
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
            child:
                BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state) {
              return BlocBuilder<StepsCountBloc, StepsState>(
                  builder: (stepContext, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is Steps) {
                  return LayoutWidgetStepsBloc(state, state.totalSteps);
                } else {
                  return const LayoutWidgetStepsBloc([]);
                }
              });
            }),
          ),
        ),
      ),
    );
  }
}

class LayoutWidgetStepsBloc extends StatelessWidget {
  final List<int> steps;
  final int? totalSteps;

  const LayoutWidgetStepsBloc(this.steps, [this.totalSteps]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 25,right: 25),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.deepOrange,
                    value: 0.9,
                    strokeWidth: 15,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Goal : 1000',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    totalSteps.toString(),
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    'steps',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Next goal: ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AchievementScreen()));
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: '2000',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          flex: 2,
          child: BarGraph(
            stepCount: steps,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Total',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: ' $totalSteps ',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'steps',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
