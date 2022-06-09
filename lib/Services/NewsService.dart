import 'package:dio/dio.dart';
import 'package:news_app/Utls/Colors.dart';

import '../Models/news.dart';

class NewsService {
  static final Dio _dio = Dio();
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = MajorAuth.newsKey;
  static final String _topHeadlines = 'top-headlines';
  static final String _everything = 'everything';
  static final String _sources = 'sources';
  static final String _country = 'us';
  static final String _language = 'en';
  static final String _sortBy = 'publishedAt';
  static final String _apiKeyParam = 'apiKey';
  static final String _countryParam = 'country';
  static final String _languageParam = 'language';
  static final String _sortByParam = 'sortBy';
  static final String _pageSizeParam = 'pageSize';
  static final String _pageParam = 'page';
  static final String _qParam = 'q';

  static Future<List<News>?> getAll() {
    return _dio.get(_baseUrl + _topHeadlines, queryParameters: {
      _apiKeyParam: _apiKey,
      _countryParam: _country,
      _languageParam: _language,
      _sortByParam: _sortBy,
      _pageSizeParam: '100',
    }).then((response) {
      final List<News> news = [];
      for (final item in response.data['articles']) {

        var id = item['source']['id'] ?? '';
        var urlToImage = item['urlToImage'];
        var title = item['title'];
        var content = item['content'];

        news.add(News.fromjson(item));
      }
      return news;
    });
  }
}
