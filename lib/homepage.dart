import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/searchview.dart';
import 'screens/homeScreen.dart';
import 'screens/exploreScreen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  stt.SpeechToText _speech;
  bool isListening = false;
  String query;
  String status;
  int _currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
  ];
  var _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  void onListen() async {
    if (!isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => status = val,
        onError: (val) => print('error: $val'),
      );
      if (available) {
        setState(() {
          isListening = true;
        });
        _speech.listen(onResult: (val) {
          setState(() {
            query = val.recognizedWords;
            if (status == 'notListening') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchView(
                    query: query,
                  ),
                ),
              );
            }
          });
        });
      }
    } else {
      setState(() {
        isListening = false;
        _speech.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onLongPress: () {},
        child: FloatingActionButton(
          child: Icon(
            Icons.mic,
            color: Colors.red.shade900,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            onListen();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        iconSize: 25.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.compass),
              label: "Explore",
              backgroundColor: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
