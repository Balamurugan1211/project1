import 'package:flutter/material.dart';

class status_page extends StatefulWidget {
  const status_page({Key? key}) : super(key: key);

  @override
  State<status_page> createState() => _status_pageState();
}

class _status_pageState extends State<status_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String pos = "OFF";
    double onopacity = 0;
    double offopacity = 0;
    if (pos == "ON") {
      setState(() {
        onopacity = 0;
        offopacity = 0.8;
      });
    } else {
      setState(() {
        onopacity = 0.8;
        offopacity = 0;
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.2, horizontal: width * 0.2),
            child: Container(
              height: height * 0.5,
              width: width * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                      strokeAlign: StrokeAlign.inside),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Stack(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Image(
                        image: AssetImage('assets/on.jpg'),
                        height: height * 0.2,
                        width: width * 0.6,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(onopacity),
                        ),
                      ),
                    ),
                  ),
                ]),
                Stack(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('assets/off.jpg'),
                        height: height * 0.2,
                        width: width * 0.6,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(offopacity),
                        ),
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
