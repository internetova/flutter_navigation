import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/green/green_counter_page.dart';

class GreenPage extends StatefulWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  State<GreenPage> createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> with AutomaticKeepAliveClientMixin<GreenPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                backgroundColor: Colors.green,
              ),
              child: const Text('GreenCounterPage'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goCounter(Color? backgroundColor) async {
    final counter = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (_) => GreenCounterPage(
          title: 'RedCounterPage',
          backgroundColor: backgroundColor,
        ),
      ),
    );

    if (counter != null) {
      setState(() {
        _counter = counter;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
