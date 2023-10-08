import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_step_counter/auth/auth_bloc/auth_state.dart';
import 'package:flutter_step_counter/repositories/user_repository.dart';
import 'package:flutter_step_counter/screens/sing_in_screen/login_screen.dart';
import 'package:flutter_step_counter/screens/testScreens/splash_screen.dart';

import 'auth/login_bloc/login_bloc.dart';
import 'auth/register_bloc/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository repository = UserRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(userRepository: repository),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(repository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UnAuthenticateState) {
              return LoginPage();
            } else if (state is AuthenticateState) {
              return HomeScreen();
            }

            return LoginPage();
          },
        ),
      ),
    );
  }
}
