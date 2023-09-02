import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/green/green_counter_page.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢--------build GreenPage');
    final bgPage = Colors.green[200];

    return Scaffold(
      backgroundColor: bgPage,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'GreenPage',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 100),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => GreenCounterPage(
                      title: 'GreenCounterPage',
                      backgroundColor: bgPage,
                    ),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                backgroundColor: Colors.green,
              ),
              child: const Text('GreenCounterPage'),
            )
          ],
        ),
      ),
    );
  }
}
