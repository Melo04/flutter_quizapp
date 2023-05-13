import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttergdsc/pages/landing_page.dart';
import 'package:fluttergdsc/pages/quiz_page.dart';

import '../components/form/custom_form_submit_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    QuizPage(),
    Text(
      'Index 1: Google',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
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
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onPageChange,
          dotIndicatorColor: Colors.grey.shade800,
          unselectedItemColor: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(horizontal: 10),
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.quiz),
              selectedColor: Colors.purple.shade600,
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.color_lens),
              selectedColor: Colors.blue,
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.orange,
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
    );
    ;
  }
}
