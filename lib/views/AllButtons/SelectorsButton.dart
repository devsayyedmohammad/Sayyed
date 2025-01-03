import 'dart:ffi';

import 'package:flutter/material.dart';

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

int selected = 0;
List<dynamic> indexSelected = [];

class Selectorsbutton extends StatefulWidget {
  Selectorsbutton({super.key});

  @override
  State<Selectorsbutton> createState() => _SelectorsbuttonState();
}

class _SelectorsbuttonState extends State<Selectorsbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text("Single Selector"),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  months.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: index == selected
                            ? Colors.black54
                            : const Color.fromARGB(255, 64, 255, 105),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(right: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          selected = index;
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.amberAccent,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            months[index],
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(months[selected]),
            SizedBox(
              height: 50,
            ),
            Text(
              "Multiple Select",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 300,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: List.generate(
                  months.length,
                  (index) => Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: indexSelected.contains(index)
                            ? const Color.fromARGB(255, 96, 95, 95)
                            : Colors.amberAccent,
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: const Color.fromARGB(221, 0, 255, 13),
                        onTap: () {
                          if (indexSelected.contains(index)) {
                            indexSelected.remove(index);
                          } else {
                            indexSelected.add(index);
                          }
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // height: 20,
                          // color: Colors.blueAccent,
                          child: Text(
                            months[index],
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ...List.generate(indexSelected.length,
                (index) => Text(months[indexSelected[index]]))
          ],
        ),
      ),
    );
  }
}
