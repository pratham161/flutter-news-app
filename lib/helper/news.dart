import 'dart:convert';

import 'package:warta/models/articlemodel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> newsArticles = [];
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=';
  Future<void> getNewsData() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          newsArticles.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> newsArticles = [];
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=';
  Future<void> getNewsData(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          newsArticles.add(articleModel);
        }
      });
    }
  }
}

class SearchNews {
  List<ArticleModel> newsArticles = [];
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=';
  Future<void> getNewsData(String query) async {
    String url =
        'https://newsapi.org/v2/everything?q=$query&apiKey=';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          newsArticles.add(articleModel);
        }
      });
    }
  }
}
