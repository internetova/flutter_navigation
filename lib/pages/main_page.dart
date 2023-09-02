import 'package:flutter/material.dart';

class BluePage extends StatelessWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Text(
          'BluePage',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
