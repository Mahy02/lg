import 'package:flutter/material.dart';
import 'package:lg/screens/home_page.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late SMIBool isMenuOpen;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(), //calling the home page
    );
  }
}
