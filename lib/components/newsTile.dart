import 'package:flutter/material.dart';
import 'package:warta/screens/articleview.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  NewsTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                articleUrl: url,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16, top: 16),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(imageUrl),
                borderRadius: BorderRadius.circular(6),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
