import 'package:flutter/material.dart';
import 'package:warta/screens/categoryview.dart';

class CategoryTile extends StatelessWidget {
  final String imagePath, title;
  CategoryTile({this.imagePath, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(
              category: title.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath,
                  height: 180, width: 200, fit: BoxFit.cover),
            ),
            Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
