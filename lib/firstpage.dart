// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/call.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/secondpage.dart';
import 'package:flutter_app/settings.dart';

// ignore: camel_case_types
class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

// ignore: camel_case_types
class _firstpageState extends State<firstpage> {
  // ignore: unused_field
  int _currentindex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: const Text('firstpage'),
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        children: const [
          Call(),
          Settings(),
        ],
      ),

      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(seconds: 1), curve: Curves.bounceOut);
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings "),
        ],
      ),
    );
  }
}