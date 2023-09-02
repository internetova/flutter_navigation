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
  /// PageStorageBucket - это объект в Flutter, который используется для хранения и управления
  /// данными, которые должны быть сохранены между страницами в PageView или других виджетах,
  /// поддерживающих сохранение состояния страниц.
  final _bucket = PageStorageBucket();

  final List<Widget> _pages = const [
    RedPage(key: PageStorageKey('RedPage')),
    BluePage(key: PageStorageKey('BluePage')),
    GreenPage(key: PageStorageKey('GreenPage')),
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    /// Это означает, что PageController запомнит, на какой странице он находится,
    /// если она будет уничтожена и воссоздана заново.
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: PageStorage(
          bucket: _bucket,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            /// Запретить свайпы
            // physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              /// В данном примере понадобится управлять контроллером, иначе не будет работать прокрутка
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
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
