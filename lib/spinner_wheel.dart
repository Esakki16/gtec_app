import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <int>[10, 20, 25, 30, 40, 50, 75, 100];

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
          setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
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
                  for (var it in items)
                    FortuneItem(child: Text(it.toString() + '%')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
