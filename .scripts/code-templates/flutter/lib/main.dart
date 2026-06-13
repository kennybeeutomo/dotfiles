import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Text",
            style: TextStyle(fontSize: 50, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
