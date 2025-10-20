import 'package:flutter/material.dart';
import '../../widgets/custom_app_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(title: 'Главная'),
          Expanded(
            child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome to Home',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This is your home screen. You can add widgets and content here.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ),
          ],
        ),
            ),
          ),
        ],
      ),
    );
  }
}
