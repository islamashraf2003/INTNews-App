import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class NewsResponse {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final int totalResults;
  @HiveField(2)
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class Article {
  @HiveField(0)
  final Source source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String url;
  @JsonKey(name: 'urlToImage')
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final String publishedAt;
  @HiveField(7)
  final String? content;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 0)
class Source {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
