import 'package:flutter/material.dart';
import '../models/news_item.dart';

class NewsViewer extends StatefulWidget {
  final List<NewsItem> allNews;
  final int initialIndex;

  const NewsViewer({
    super.key,
    required this.allNews,
    required this.initialIndex,
  });

  @override
  State<NewsViewer> createState() => _NewsViewerState();
}

class _NewsViewerState extends State<NewsViewer> {
  late PageController _newsController;
  late int _currentNewsIndex;

  @override
  void initState() {
    super.initState();
    _currentNewsIndex = widget.initialIndex;
    _newsController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _newsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _newsController,
            itemCount: widget.allNews.length + 1,
            onPageChanged: (index) {
              if (index == widget.allNews.length) {
                Navigator.of(context).pop();
              } else {
                setState(() {
                  _currentNewsIndex = index;
                });
              }
            },
            itemBuilder: (context, index) {
              if (index == widget.allNews.length) {
                return const SizedBox.shrink();
              }
              return _NewsDetailView(
                news: widget.allNews[index],
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_currentNewsIndex + 1}/${widget.allNews.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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

class _NewsDetailView extends StatefulWidget {
  final NewsItem news;

  const _NewsDetailView({
    required this.news,
  });

  @override
  State<_NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<_NewsDetailView> {
  late PageController _slideController;
  int _currentSlide = 0;

  @override
  void initState() {
    super.initState();
    _slideController = PageController();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentSlide < widget.news.slides.length - 1) {
      _slideController.animateToPage(
        _currentSlide + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextSlide,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withValues(alpha: 0.8),
              Theme.of(context).primaryColor.withValues(alpha: 0.95),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.news.slides.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 3,
                      width: 40,
                      decoration: BoxDecoration(
                        color: _currentSlide >= index
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: PageView.builder(
                  controller: _slideController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.news.slides.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentSlide = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final slide = widget.news.slides[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.news.imageUrl != null && index == 0)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: Text(
                                widget.news.imageUrl!,
                                style: const TextStyle(fontSize: 80),
                              ),
                            ),
                          Text(
                            slide.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            slide.content,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 16,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (index == widget.news.slides.length - 1)
                            Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: Text(
                                'Свайпните для следующей новости →',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12,
                                ),
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: Text(
                                'Нажмите для продолжения',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
