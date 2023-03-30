import 'package:flutter/material.dart';
import 'package:project1/home_screen.dart';
import 'package:project1/smsresponse.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
