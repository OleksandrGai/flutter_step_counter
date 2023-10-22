import 'package:flutter/material.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  static const String routeName = '/achievement';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child:  Padding(
          padding:  EdgeInsets.only(left: 12, right: 12, top: 8),
          child: GridLayoutWidget(),
        ),
      ),
    );
  }
}

class GridLayoutWidget extends StatelessWidget {
  const GridLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double value = 0.0;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemBuilder: (context, index) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.deepOrange,
                  value: value + 0.5,
                  strokeWidth: 15,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Goal : 1000',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '500',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'steps',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        );
      },
      itemCount: 10,
    );
  }
}
