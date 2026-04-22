import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

//TODO: family issue an need some times
