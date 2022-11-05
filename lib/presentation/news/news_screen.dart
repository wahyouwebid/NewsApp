import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/dio_client.dart';
import 'package:news_app/widget/newslist_view_widget.dart';

import '../../service/api_client.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NEWS APP"),
        ),

        body: _buildBody(context),
      ),
    );
  }

  FutureBuilder<News> _buildBody(BuildContext context) {
    final dio = DioClient().buildDioClient();
    final client = ApiClient(dio);

    return FutureBuilder<News>(
      future: client.getTopHeadlines("id", "business"),
      builder: (context, AsyncSnapshot<News>? snapshot) {
        if (snapshot?.data != null) {
          final List<Article>? data = snapshot?.data!.articles;
          return newsListView(context, data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


}
