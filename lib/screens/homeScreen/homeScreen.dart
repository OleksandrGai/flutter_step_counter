import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_bloc.dart';
import 'package:flutter_step_counter/auth/logout_bloc/logout_state.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';

import '../../auth/logout_bloc/logout_event.dart';
import '../../repositories/step_repository.dart';
import 'bar_graph_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<HomeScreen> {
  final now = DateTime.now();
  List<int> step = [];
  int totalStep = 0;
  StepRepository stepRepository = StepRepository();

  @override
  void initState() {
    super.initState();
    stepRepository.initStepData().then((value) => step.addAll(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.only(left: 6, right: 6, top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: BarGraph(
                      stepCount: step,
                    ),
                  ),
                  Row(
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
                          text: ' $totalStep ',
                          style: const TextStyle(
                            fontSize: 25,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Left',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: ' 500 ',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'steps to the next goal',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      thickness: 5,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
