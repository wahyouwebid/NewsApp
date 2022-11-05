import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';
part 'news_model.g.dart';

@JsonSerializable()
class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
