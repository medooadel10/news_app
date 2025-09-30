import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_response_model.dart';

class NewsProvider extends ChangeNotifier {
  List<ArticleModel> articles = [];
  bool isLoading = false;
  void getHeadlines() async {
    isLoading = true;
    notifyListeners();
    final dio = Dio();
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '23a3bb9854b649edb0914df6a0d70611',
      },
    );
    final articlesResponseModel = ArticlesResponseModel.fromMap(response.data);
    articles = articlesResponseModel.articles;
    isLoading = false;
    notifyListeners();
  }
}
