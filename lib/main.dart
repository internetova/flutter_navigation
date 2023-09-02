import 'package:collection/collection.dart';
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
        body: Stack(
          children: _pages
          /// Метод из пакета collection
          /// Iterable<R> mapIndexed<R>(R Function(int, Widget) convert)
              .mapIndexed(
            /// Offstage - это виджет Flutter, который позволяет управлять видимостью
            /// (отображением или скрытием) своего потомка без удаления его из дерева виджетов.
            /// В отличие от виджетов, которые просто скрываются, Offstage сохраняет своего
            /// потомка в дереве виджетов и может быть полезным для оптимизации производительности
            /// и управления видимостью в зависимости от определенных условий или состояний приложения.
            //
            // Offstage имеет один обязательный параметр:
            //
            // offstage: Булево значение, которое определяет, отображается ли потомок виджета
            // (false) или скрыт (true).
                (i, w) => Offstage(
                  offstage: i != _currentIndex,
                  /// TickerMode - это виджет Flutter, который позволяет управлять активацией и
                  /// деактивацией анимаций и обновлений виджета. Он может быть полезным в случаях,
                  /// когда вы хотите временно приостановить анимации или обновления виджета,
                  /// чтобы оптимизировать производительность или предотвратить ненужные
                  /// изменения состояния в определенных ситуациях.
                  //
                  // TickerMode имеет один обязательный параметр:
                  //
                  // enabled: Булево значение, которое определяет, активирован ли режим
                  // тикера (true) или отключен (false).
                  // Когда TickerMode установлен в false, все анимации и обновления виджета,
                  // которые зависят от Ticker, будут приостановлены. Это может быть полезно,
                  // например, при переключении между вкладками или экранами в приложении,
                  // чтобы избежать лишних вычислений и обновлений.
                  child: TickerMode(
                    enabled: i == _currentIndex,
                    child: w,
                  ),
                ),
              )
              .toList(),
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
