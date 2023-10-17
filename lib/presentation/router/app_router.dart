import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                title: 'Home Screen', color: Colors.blueAccent));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'Second Screen', color: Colors.redAccent));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'Third Screen', color: Colors.greenAccent));

      default:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                title: 'Home Screen', color: Colors.blueAccent));
    }
  }
}
