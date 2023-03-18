import 'package:flutter/material.dart';
import 'package:lg/utils/entry_point.dart';

void main() {
  runApp(const LgApp());
}

class LgApp extends StatelessWidget {
  const LgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EntryPoint(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

/*
we would need a home page, a page that displays the picture and the explanation, a calendar page
the 4 buttons=> button in home page, in picture page () 1 button for choosing a specific time and random and explanation)
we would havea logo and a backbutton
*/
