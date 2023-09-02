import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/blue/blue_page.dart';
import 'package:flutter_navigation/pages/green/green_page.dart';
import 'package:flutter_navigation/pages/red/red_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    RedPage(),
    BluePage(),
    GreenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Red',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Blue',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Green',
            ),
          ],
        ),
      ),
    );
  }
}
