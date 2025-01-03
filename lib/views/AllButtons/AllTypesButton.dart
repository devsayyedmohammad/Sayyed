import 'package:flutter/material.dart';
import 'package:functionalapp/views/AllButtons/counters.dart';
import 'package:functionalapp/views/ButtonSelector/selectors.dart';

class Alltypesbutton extends StatelessWidget {
  const Alltypesbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text("Elevated Button"),
            ),
            SizedBox(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Counters(),
                    ),
                  );
                },
                child: Text("Elevated Button"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              width: 200,
              child: InkWell(
                splashColor: const Color.fromARGB(255, 4, 40, 244),
                child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.amberAccent)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Selectors()));
                  },
                  child: Text("Filled Button"),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              width: 200,
              child: FilledButton.tonal(
                onPressed: () {},
                child: Text(
                  "Tonal Button",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: Text("data"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Hello"),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
