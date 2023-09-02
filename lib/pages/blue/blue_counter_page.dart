import 'package:flutter/material.dart';

class BlueCounterPage extends StatefulWidget {
  final String title;
  final Color? backgroundColor;

  const BlueCounterPage({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  State<BlueCounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<BlueCounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔵--------build BlueCounterPage');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: widget.backgroundColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
