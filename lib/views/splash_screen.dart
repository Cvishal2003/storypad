import 'package:flutter/material.dart';
import 'package:storypad/initializers/app_lock_initializer.dart';
import 'package:storypad/initializers/onboarding_initializer.dart';
import 'package:storypad/views/home/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    // Both of these initializers were causing hangs or crashes.
    // They need to be debugged separately.
    // For now, we disable them to get the app running.
    // await OnboardingInitializer.call();
    // await AppLockInitializer.call();

    // With the problematic initializers disabled, we navigate directly
    // to the home screen.
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
