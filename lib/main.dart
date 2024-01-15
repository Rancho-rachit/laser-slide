import 'package:flutter/material.dart';
import 'package:widgets/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Laser Slide',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
