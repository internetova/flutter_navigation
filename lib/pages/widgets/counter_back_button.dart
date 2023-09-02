import 'package:flutter/material.dart';

class CounterBackButton extends StatelessWidget {
  final int? counter;

  const CounterBackButton({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context, counter);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
