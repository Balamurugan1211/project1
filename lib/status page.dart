import 'package:flutter/material.dart';

class status_page extends StatefulWidget {
  const status_page({Key? key}) : super(key: key);

  @override
  State<status_page> createState() => _status_pageState();
}

class _status_pageState extends State<status_page> {
  @override
  Widget build(BuildContext context) {
    String pos = "ON";
    var status = 'assets/off.jpg';
    if (pos == "ON") {
      setState(() {
        status = 'assets/on.jpg';
      });
    } else {
      setState(() {
        status = 'assets/off.jpg';
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("STATUS"),
        titleTextStyle: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 10,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image(image: AssetImage(status)),
        ),
      ),
    );
  }
}
