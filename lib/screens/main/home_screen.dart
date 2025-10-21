import 'package:flutter/material.dart';
import '../../widgets/custom_app_header.dart';
import '../../widgets/news_slider.dart';
import '../../models/news_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppHeader(title: 'Главная'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const SizedBox(height: 12),
                  NewsSlider(newsItems: sampleNews),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
