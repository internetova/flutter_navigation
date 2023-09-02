import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/blue/blue_counter_page.dart';

class BluePage extends StatefulWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  State<BluePage> createState() => _BluePageState();
}

class _BluePageState extends State<BluePage>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _counter = PageStorage.of(context).readState(context, identifier: widget.key) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔵--------build BluePage');
    final bgPage = Colors.blue[200];

    return Scaffold(
      backgroundColor: bgPage,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'BluePage',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Counter $_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 100),
            FilledButton(
              onPressed: () => _goCounter(bgPage),
              style: FilledButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                backgroundColor: Colors.blue,
              ),
              child: const Text('BlueCounterPage'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goCounter(Color? backgroundColor) async {
    final counter = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => BlueCounterPage(
          title: 'RedCounterPage',
          backgroundColor: backgroundColor,
        ),
      ),
    );

    if (counter != null) {
      setState(() {
        _counter = counter;
        PageStorage.of(context).writeState(context, _counter, identifier: widget.key);
      });
    }
  }
}
