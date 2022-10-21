import 'package:first_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    int day = 1;
    return MaterialApp(
      home: Homepage(),
    );
  }
}
