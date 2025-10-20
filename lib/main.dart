import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/auth/phone_input_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/main/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PhoneInputScreen(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final phoneNumber = state.extra as String? ?? '';
        return VerificationScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const MainNavigationScreen(),
    ),
  ],
);
