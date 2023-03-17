import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project1/register.dart';

import 'login.dart';

class home_screen extends StatefulWidget {
  var pageindex;
  home_screen({Key? mykey, this.pageindex}) : super(key: mykey);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  int _selectedindex = 0;
  final screens = [login(), register()];
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final items = [Icon(Icons.login), Icon(Icons.app_registration)];
    setState(() {
      if (widget.pageindex != null) {
        _selectedindex = widget.pageindex;
        widget.pageindex = null;
      }
    });
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedindex,
          items: items,
          buttonBackgroundColor: Colors.indigo,
          animationDuration: Duration(milliseconds: 250),
          onTap: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          height: height * 0.07,
          backgroundColor: Colors.transparent,
          color: Colors.black54,
        ),
        body: IndexedStack(
          index: _selectedindex,
          children: screens,
        ),
      ),
    );
  }
}
