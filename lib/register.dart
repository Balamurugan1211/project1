import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool _isvalid = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text("REGISTER",
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                                color: Colors.indigo))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                            labelText: "USERNAME",
                            labelStyle: TextStyle(
                                color: Colors.indigo, fontSize: 18.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.indigo,
                            ),
                            labelText: "EMAIL ADDRESS",
                            labelStyle: TextStyle(
                                color: Colors.indigo, fontSize: 18.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.indigo,
                            ),
                            labelText: "MOBILE NUMBER",
                            labelStyle: TextStyle(
                                color: Colors.indigo, fontSize: 18.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                                color: Colors.indigo, fontSize: 18.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                            labelText: "CONFIRM PASSWORD",
                            labelStyle: TextStyle(
                                color: Colors.indigo, fontSize: 18.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 30.0),
                      child: Center(
                          child: SizedBox(
                        height: height * 0.08,
                        width: width - 30,
                        child: MaterialButton(
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            )),
                      )),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
