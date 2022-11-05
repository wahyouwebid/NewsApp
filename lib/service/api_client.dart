import 'package:dio/dio.dart';
import 'package:news_app/utils/config.dart';
import 'package:news_app/utils/endpoint.dart';
import 'package:retrofit/http.dart';

import '../model/news_model.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Endpoint.topHeadlines + Config.apiKey)
  Future<News> getTopHeadlines(
    @Query("country") String country,
    @Query("category") String category,
  );
}
