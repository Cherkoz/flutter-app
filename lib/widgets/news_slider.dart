import 'package:flutter/material.dart';
import '../models/news_item.dart';
import 'news_viewer.dart';

class NewsSlider extends StatelessWidget {
  final List<NewsItem> newsItems;

  const NewsSlider({
    super.key,
    required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final news = newsItems[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _NewsCard(
              news: news,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewsViewer(
                      allNews: newsItems,
                      initialIndex: index,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final NewsItem news;
  final VoidCallback onTap;

  const _NewsCard({
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (news.imageUrl != null)
              Text(
                news.imageUrl!,
                style: const TextStyle(fontSize: 32),
              )
            else
              Icon(
                Icons.article,
                size: 32,
                color: Colors.white.withOpacity(0.9),
              ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                news.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
