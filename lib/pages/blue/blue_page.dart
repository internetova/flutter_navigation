import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/blue/blue_counter_page.dart';

class BluePage extends StatelessWidget {
  const BluePage({Key? key}) : super(key: key);

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
            const SizedBox(height: 100),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlueCounterPage(
                      title: 'BlueCounterPage',
                      backgroundColor: bgPage,
                    ),
                  ),
                );
              },
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
}
