import 'package:flutter/material.dart';
import 'package:flutter_step_counter/screens/homeScreen/homeScreen.dart';

import '../screens/achievement_screen/achievement_screen.dart';


class MainBottomBarNavigation extends StatefulWidget {
  const MainBottomBarNavigation({super.key});

  @override
  State<StatefulWidget> createState() => MainBottomBarNavigationState();
}

class MainBottomBarNavigationState extends State<MainBottomBarNavigation> {
  var _currentIndex = 0;

  late final _routingWidgetBuilderMap = <String, WidgetBuilder>{
    HomeScreen.routeName: (_) => const HomeScreen(),
    AchievementScreen.routeName: (_) => const AchievementScreen(),
  };

  void _userTab(int userTab) {
    if (userTab == _currentIndex) return;
    setState(() => _currentIndex = userTab);
  }

  final _items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: '1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      label: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigableStack(
        selectedIndex: _currentIndex,
        initialRoutes: _routingWidgetBuilderMap.keys.toList(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder:
                _routingWidgetBuilderMap[settings.name] ?? (_) => Container(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _items,
        currentIndex: _currentIndex,
        onTap: _userTab,
      ),
    );
  }
}

class NavigableStack extends StatelessWidget {
  const NavigableStack({
    super.key,
    required this.initialRoutes,
    required this.onGenerateRoute,
    required this.selectedIndex,
  });

  final List<String> initialRoutes;
  final RouteFactory onGenerateRoute;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        for (final initialRoute in initialRoutes)
          Navigator(
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
          ),
      ],
    );
  }
}
