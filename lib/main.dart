import 'package:flutter/material.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/routers/router.dart';

Future<void> main() async {
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Routers.splashPage,
    );
  }
}
