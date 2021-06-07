import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function onChange, onPress;

  SearchBar({@required this.onChange, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: TextField(
        keyboardType: TextInputType.url,
        textInputAction: TextInputAction.go,
        onChanged: onChange,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.red.shade900,
            ),
            onPressed: onPress,
          ),
          hintText: "Search",
          contentPadding: EdgeInsets.only(top: 16, right: 16, left: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
