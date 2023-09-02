import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/widgets/counter_back_button.dart';

class RedCounterPage extends StatefulWidget {
  final String title;
  final Color? backgroundColor;

  const RedCounterPage({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  @override
  State<RedCounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<RedCounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴--------build RedCounterPage');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        title: Text(widget.title),
        leading: CounterBackButton(counter: _counter),
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
