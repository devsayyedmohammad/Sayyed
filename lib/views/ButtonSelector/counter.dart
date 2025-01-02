import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 75,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {
                    if (count != 0) {
                      count--;
                      setState(() {});
                      print(count);
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton.filled(
                  onPressed: () {
                    if (count != 100) {
                      count++;
                      setState(() {});
                      print(count);
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
