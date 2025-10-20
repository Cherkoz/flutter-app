import 'package:flutter/material.dart';
import '../../widgets/custom_app_header.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(title: 'Курсы'),
          Expanded(
            child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.book,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Your Courses',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Browse and manage your courses. Track your learning progress and access course materials.',
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
