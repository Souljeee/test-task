import 'package:flutter/material.dart';
import 'package:test_task/core/data/subscription_repository.dart';
import 'package:test_task/home/ui/home_screen.dart';
import 'package:test_task/onboarding/ui/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final subscriptionRepository = const SubscriptionRepository();

  final hasSubscription = await subscriptionRepository.hasSubscription();

  runApp(ApplicationContext(hasSubscription: hasSubscription));
}

class ApplicationContext extends StatelessWidget {
  const ApplicationContext({super.key, required this.hasSubscription});

  final bool hasSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: hasSubscription ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}