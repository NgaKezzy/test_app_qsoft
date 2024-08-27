import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/routers/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routers.homePage,
        (route) {
          return false;
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Icon(
              Icons.shopping_cart,
              size: 100,
              color: Colors.orange,
            ),
            Text('© 2024, QSoft. All rights reserved.')
          ],
        ),
      ),
    );
  }
}
