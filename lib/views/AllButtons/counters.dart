import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  const Counters({super.key});

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
              "0",
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
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
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
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 51, 255, 0),
                        border: Border.all(color: Colors.black)),
                    child: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
