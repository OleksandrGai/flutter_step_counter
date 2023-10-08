import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('AuthenticateState'),),);
  }
}
