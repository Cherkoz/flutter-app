import 'package:flutter/material.dart';
import '../../widgets/custom_app_header.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(title: 'Расписание'),
          Expanded(
            child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Your Schedule',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'View and manage your schedule here. Add events, appointments, and reminders.',
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
