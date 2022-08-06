import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:frontend_flutter/model/news/news_model.dart';

class NewsRepository {
  Future<List<News>> getNews() async {
    final loadJsonFile = await rootBundle.loadString("Assets/Json/news.json");
    final jsonDecodeFile = jsonDecode(loadJsonFile);
    var jsonFile = jsonDecodeFile["news"];
    List<News> listNews =
        List.from(jsonFile).map<News>((data) => News.fromJson(data)).toList();
    return listNews;
  }
}
