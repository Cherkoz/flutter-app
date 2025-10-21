class NewsItem {
  final String id;
  final String title;
  final List<NewsSlide> slides;
  final String? imageUrl;

  NewsItem({
    required this.id,
    required this.title,
    required this.slides,
    this.imageUrl,
  });
}

class NewsSlide {
  final String title;
  final String content;
  final String? imageUrl;

  NewsSlide({
    required this.title,
    required this.content,
    this.imageUrl,
  });
}

// Sample news data
final List<NewsItem> sampleNews = [
  NewsItem(
    id: '1',
    title: 'Новый курс по Flutter',
    imageUrl: '🚀',
    slides: [
      NewsSlide(
        title: 'Запуск нового курса',
        content: 'Мы рады представить новый углубленный курс по Flutter разработке. Изучите современные подходы и best practices.',
      ),
      NewsSlide(
        title: 'Что вы узнаете',
        content: 'State management, архитектура приложений, работа с API, анимации и многое другое.',
      ),
      NewsSlide(
        title: 'Старт курса',
        content: 'Курс стартует 1 ноября. Успейте записаться со скидкой 30%!',
      ),
    ],
  ),
  NewsItem(
    id: '2',
    title: 'Обновление платформы',
    imageUrl: '⚡',
    slides: [
      NewsSlide(
        title: 'Новые возможности',
        content: 'Мы добавили поддержку темной темы, улучшили производительность и обновили дизайн.',
      ),
      NewsSlide(
        title: 'Что изменилось',
        content: 'Новый навигационный интерфейс, быстрый доступ к избранному, синхронизация между устройствами.',
      ),
    ],
  ),
  NewsItem(
    id: '3',
    title: 'Интервью с экспертом',
    imageUrl: '💡',
    slides: [
      NewsSlide(
        title: 'Встреча с профессионалом',
        content: 'На следующей неделе состоится онлайн-интервью с ведущим Flutter разработчиком из Google.',
      ),
      NewsSlide(
        title: 'Темы обсуждения',
        content: 'Будущее Flutter, новые фичи Flutter 4.0, карьерные советы для начинающих разработчиков.',
      ),
      NewsSlide(
        title: 'Как присоединиться',
        content: 'Зарегистрируйтесь на нашем сайте и получите ссылку на трансляцию за день до события.',
      ),
    ],
  ),
  NewsItem(
    id: '4',
    title: 'Конкурс разработчиков',
    imageUrl: '🏆',
    slides: [
      NewsSlide(
        title: 'Участвуйте и выигрывайте',
        content: 'Объявляем старт конкурса на лучшее Flutter приложение! Призовой фонд 500,000 рублей.',
      ),
      NewsSlide(
        title: 'Условия участия',
        content: 'Создайте приложение на Flutter, загрузите код на GitHub и отправьте заявку до 15 декабря.',
      ),
    ],
  ),
  NewsItem(
    id: '5',
    title: 'Библиотека месяца',
    imageUrl: '📚',
    slides: [
      NewsSlide(
        title: 'Riverpod 2.0',
        content: 'Знакомим вас с обновленной версией популярной библиотеки для state management.',
      ),
      NewsSlide(
        title: 'Ключевые особенности',
        content: 'Улучшенная типобезопасность, новый синтаксис, лучшая производительность и DevTools интеграция.',
      ),
      NewsSlide(
        title: 'Начните использовать',
        content: 'Смотрите наш видео-туториал и примеры кода в документации.',
      ),
    ],
  ),
  NewsItem(
    id: '6',
    title: 'Сообщество растет',
    imageUrl: '👥',
    slides: [
      NewsSlide(
        title: 'Достижение',
        content: 'Нас уже более 10,000 активных пользователей! Спасибо за вашу поддержку и участие.',
      ),
      NewsSlide(
        title: 'Новые возможности',
        content: 'Запускаем форум для обсуждений, еженедельные вебинары и менторскую программу.',
      ),
    ],
  ),
];
