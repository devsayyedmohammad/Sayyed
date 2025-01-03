import 'package:flutter/material.dart';
import 'package:functionalapp/views/AllButtons/AllTypesButton.dart';
import 'package:functionalapp/views/AllButtons/SelectorsButton.dart';
import 'package:functionalapp/views/AllButtons/counters.dart';
import 'package:functionalapp/views/input_widgets.dart';
import 'package:functionalapp/views/modalsAndDialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.light(primary: Colors.black87),
          ),
      home: ModalsAndDialogs(),
    );
  }
}
