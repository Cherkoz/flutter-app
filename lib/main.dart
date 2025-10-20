import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/auth/phone_input_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/main/main_navigation_screen.dart';
import 'screens/main/post_detail_screen.dart';
import 'models/post.dart';

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
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF3B82F6), // Ваш основной цвет (accent)
          secondary: const Color(0xFF10B981), // Дополнительный цвет
          tertiary: const Color(0xFF8B5CF6), // Третичный цвет
          surface: Colors.white, // Цвет поверхностей (карточки, bottom sheets)
          error: const Color(0xFFEF4444), // Цвет ошибок
          onPrimary: Colors.white, // Цвет текста/иконок на primary
          onSecondary: Colors.white, // Цвет текста/иконок на secondary
          onSurface: const Color(0xFF1F2937), // Цвет текста на surface
        ),
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
    GoRoute(
      path: '/post/:id',
      builder: (context, state) {
        final post = state.extra as Post;
        return PostDetailScreen(post: post);
      },
    ),
  ],
);
