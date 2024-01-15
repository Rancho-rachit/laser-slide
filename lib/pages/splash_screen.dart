import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgets/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      childWidget: Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Beyond',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      nextScreen: const HomePage(),
      duration: const Duration(milliseconds: 3000),
      onInit: () async {
        debugPrint("onInit");
      },
    );
  }
}
