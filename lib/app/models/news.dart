import 'package:equatable/equatable.dart';
import 'package:news_finder_task/app/helpers/extentions/string.dart';

class NewsModel extends Equatable {
  final String source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;

  const NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: (json['publishedAt'] as String).toDate(),
    );
  }

  @override
  List<Object?> get props => [
        author,
        title,
        url,
        urlToImage,
        publishedAt,
      ];
}
