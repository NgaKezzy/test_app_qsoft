import 'package:flutter/material.dart';
import 'package:test_app/features/pages/home/home_page.dart';
import 'package:test_app/features/pages/splash/splash_screen.dart';

class Routers {
  static const String splashPage = '/';
  static const String homePage = '/homePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'Không có tuyến đường nào được xác định cho ${settings.name}')),
                ));
    }
  }
}
