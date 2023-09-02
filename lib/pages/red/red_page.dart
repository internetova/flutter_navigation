import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/red/red_counter_page.dart';

class RedPage extends StatefulWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _counter = PageStorage.of(context).readState(context, identifier: widget.key) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴--------build RedPage');
    final bgPage = Colors.red[200];

    return Scaffold(
      backgroundColor: bgPage,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'RedPage',
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
              ),
              child: const Text('RedCounterPage'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goCounter(Color? backgroundColor) async {
    final counter = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => RedCounterPage(
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
