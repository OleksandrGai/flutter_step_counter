import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/register_bloc/register_bloc.dart';
import 'package:flutter_step_counter/auth/register_bloc/register_state.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';
import 'package:flutter_step_counter/screens/testScreens/splash_screen.dart';

import '../../auth/register_bloc/register_event.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSucceed) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    }
                  },
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const Scaffold(
                        body: SafeArea(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    } else if (state is RegisterFailed) {
                      return buildError(state.message);
                    } else if (state is RegisterSucceed) {
                      passwordController.text = "";
                      emailController.text = "";
                      return Container();
                    }
                    return Column(children: [
                      const Text(
                        'Register below with your details!',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600),
                              ),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600),
                              ),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<RegisterBloc>().add(SingUpButtonPressed(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 169, 212, 232),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 7),
                            child: Text(
                              'I am a member?',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginPage()));
                            },
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]);
                  }),
                ),
              ),
            ),
          ));
    });
  }
}

Widget buildError(String error) {
  return Text(error);
}
