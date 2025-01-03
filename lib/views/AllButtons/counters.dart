import 'dart:math';

import 'package:flutter/material.dart';

class Counters extends StatefulWidget {
  Counters({super.key});

  @override
  State<Counters> createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  int count = 5;

  String? full;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 42, 153, 244),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 72),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 33, 33),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: const Color.fromARGB(255, 79, 244, 54),
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        if (count != 0) {
                          count--;
                          setState(() {});
                          print(count);
                        }
                        if (count == "0") {
                          setState(() {});
                        }
                        full = "10 is min";
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 51, 255, 0),
                      border: Border.all(color: Colors.black)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: const Color.fromARGB(255, 248, 2, 2),
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        if (count != 10) {
                          count++;
                          setState(() {});
                          print(count);
                        }
                        if (count == "10") {
                          full = "10 is max";
                        }
                        setState(() {});
                      },
                      child: Container(
                          height: 50, width: 50, child: Icon(Icons.add)),
                    ),
                  ),
                ),
              ],
            ),
            Text(full.toString())
          ],
        ),
      ),
    );
  }
}
