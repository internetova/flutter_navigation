import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/red/red_counter_page.dart';

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

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
            const SizedBox(height: 100),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RedCounterPage(
                      title: 'RedCounterPage',
                      backgroundColor: bgPage,
                    ),
                  ),
                );
              },
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
}
