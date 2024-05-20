import 'dart:io';

import 'package:news_finder_task/app/config/constants.dart';
import 'package:news_finder_task/app/helpers/api.dart';
import 'package:news_finder_task/app/helpers/end_points.dart';
import 'package:news_finder_task/app/helpers/enums.dart';
import 'package:news_finder_task/app/models/news.dart';

class NewsServices {
  Future<List<NewsModel>> getNews({
    int page = 1,
    CategoriesEnum? category,
  }) async {
    final res = await Api.get(
      EndPoints.headlines,
      query: {
        'apiKey': Constants.apiKey,
        'country': 'sa',
        'page': page,
        if (category != null) 'category': category.name,
      },
    );

    if (res.statusCode != HttpStatus.ok) {
      throw res.data['message'] ?? res.data;
    }
    return (res.data['articles'] as List)
        .map(
          (e) => NewsModel.fromJson(e),
        )
        .toList();
  }
}
