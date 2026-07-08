import 'package:flutter/material.dart';
import 'package:test_task/onboarding/ui/onboarding_screen.dart';

void main() {
  runApp(const ApplicationContext());
}

class ApplicationContext extends StatelessWidget {
  const ApplicationContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}