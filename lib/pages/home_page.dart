import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttergdsc/pages/landing_page.dart';
import 'package:fluttergdsc/pages/quiz_page.dart';
import 'package:fluttergdsc/pages/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    QuizPage(),
    WeatherPage(),
    LandingPage(),
  ];

  void _onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(child: _widgetOptions.elementAt(_selectedIndex)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DotNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: _onPageChange,
                  items: [
                    DotNavigationBarItem(
                      icon: Icon(Icons.quiz),
                      selectedColor: const Color.fromARGB(255, 114, 255, 122),
                    ),
                    DotNavigationBarItem(
                      icon: Icon(Icons.sunny),
                      selectedColor: Color.fromARGB(255, 255, 189, 82),
                    ),
                    DotNavigationBarItem(
                      icon: Icon(Icons.person),
                      selectedColor: Color.fromARGB(255, 42, 49, 255),
                    ),
                  ],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}