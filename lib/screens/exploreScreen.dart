import 'package:flutter/material.dart';
import 'package:warta/components/searchbar.dart';
import 'package:warta/components/categorytile.dart';
import 'package:warta/screens/searchview.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String query;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Explore',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SearchBar(
                onChange: (value) {
                  query = value;
                },
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchView(
                        query: query,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 22,
                  children: [
                    CategoryTile(
                      imagePath: 'images/buisness.jpg',
                      title: 'Business',
                    ),
                    CategoryTile(
                      imagePath: 'images/entertainment.jpg',
                      title: 'Entertainment',
                    ),
                    CategoryTile(
                      imagePath: 'images/health.jpg',
                      title: 'Health',
                    ),
                    CategoryTile(
                      imagePath: 'images/science.jpg',
                      title: 'Science',
                    ),
                    CategoryTile(
                      imagePath: 'images/sports.jpg',
                      title: 'Sports',
                    ),
                    CategoryTile(
                      imagePath: 'images/technology.jpg',
                      title: 'Technology',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
