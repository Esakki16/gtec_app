import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  StreamController<int> selected = StreamController<int>();
  int spinCount = 0;

  final List<int> items = [10, 20, 25, 30, 40, 50, 75, 100];

  // Predefined fixed spins (e.g., 5th spin = 100%, 7th spin = 20%)
  final Map<int, int> fixedDiscounts = {5: 100, 7: 20};

  int getDiscountIndex() {
    spinCount++;

    // Check if this spin has a predefined discount
    if (fixedDiscounts.containsKey(spinCount)) {
      return items.indexOf(fixedDiscounts[spinCount]!);
    }

    // Otherwise, return a random discount index
    return Random().nextInt(items.length);
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 39, 144),
        title: const Text(
          'G-TEC Discount Wheel',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          print("Spin");
          setState(() {
            selected.add(getDiscountIndex());
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text('$it%')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
