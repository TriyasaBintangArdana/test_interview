import 'package:flutter/material.dart';
import 'package:test_interview/models/news_models.dart';
import 'package:test_interview/service/api_service.dart';

class NewsProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isLoading = false;
  NewsModel? newsApi;
  bool get _isLoading => isLoading;

  Future<void> loadNews() async{
    try {
     newsApi = await _apiService.fetchApi('tesla');
      print(newsApi?.articles?.first.title ?? 'Kosong');
    } catch (e) {
      print(e);
    }
    isLoading =false;
    notifyListeners();
 }
}