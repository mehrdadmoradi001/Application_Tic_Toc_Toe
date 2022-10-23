import 'package:aplication_tic/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
