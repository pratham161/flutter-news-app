import 'package:flutter/material.dart';
import 'package:warta/models/articlemodel.dart';
import 'package:warta/helper/news.dart';
import 'package:warta/components/newsTile.dart';

class SearchView extends StatefulWidget {
  final String query;
  SearchView({this.query});
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchNews();
  }

  getSearchNews() async {
    SearchNews news = SearchNews();
    await news.getNewsData(widget.query);
    articles = news.newsArticles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          widget.query,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    description: articles[index].description,
                    url: articles[index].url,
                  );
                },
              ),
            ),
    );
  }
}
