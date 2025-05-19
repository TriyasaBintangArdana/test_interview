import 'package:dio/dio.dart';
import 'package:test_interview/models/news_models.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      headers: {
        'Authorization' : 'Bearer 1a9a961f2bb142e8bb12e62fbefeb105'
      },
    ),
  );

  Future<NewsModel> fetchApi(String query) async {
    try {
      final response = await dio.get("/everything",
      queryParameters: {
        'q': query,
        'from' : "2025-04-19",
        'sortBy' : 'publishedAt' 
      });
      return NewsModel.fromJson(response.data);
    } 
    on DioException catch(e){
      print(e);
      throw Exception("Gagal Load Data $e");
    }
    catch (e) {
      throw Exception("Gagal Mengambil Data $e");
    }
  }
}