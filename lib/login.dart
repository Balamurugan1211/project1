import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/home_screen.dart';
import 'package:project1/register.dart';
import 'package:project1/status%20page.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

  final mobileno = TextEditingController();
  final password = TextEditingController();
  String mobno = "";
  String psswd = "";
  String merror = "";
  String perror = "";

  void loginUser() async {
    var url = 'http://192.168.20.166/Auth/login.php';
    var response = await http.post(Uri.parse(url), body: {
      'mob': mobno,
      'password': psswd,
    });
    print(response.body);
    if (jsonDecode(response.body) == "Success") {
      mobileno.clear();
      password.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => status_page()));
    }
  }

  @override
  void dispose() {
    mobileno.dispose();
    password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text(
                  "LOGIN",
                  style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                          color: Colors.indigo)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 21),
                    controller: mobileno,
                    cursorHeight: 0,
                    cursorWidth: 0,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo)),
                        prefixIcon: Icon(Icons.phone, color: Colors.indigo),
                        labelText: "MOBILE NUMBER",
                        labelStyle:
                            TextStyle(color: Colors.indigo, fontSize: 18),
                        errorText: merror,
                        errorBorder: merror == ""
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: merror == ""
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: TextField(
                    controller: password,
                    obscureText: passwordVisible,
                    style: TextStyle(fontSize: 21),
                    cursorHeight: 0,
                    cursorWidth: 0,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo)),
                        prefixIcon: Icon(Icons.lock_open, color: Colors.indigo),
                        labelText: "PASSWORD",
                        errorText: perror,
                        errorBorder: perror == ""
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: perror == ""
                            ? UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))
                            : UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                        labelStyle:
                            TextStyle(color: Colors.indigo, fontSize: 18),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.indigo,
                            ))),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(fontSize: 17),
                        ))),
                Center(
                    child: SizedBox(
                  height: height * 0.08,
                  width: width - 30,
                  child: MaterialButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        if (mobileno.text.isNotEmpty &&
                            mobileno.text.length == 10 &&
                            password.text.isNotEmpty) {
                          setState(() {
                            mobno = mobileno.text;
                            psswd = password.text;
                          });
                          setState(() {
                            perror = "";
                            merror = "";
                          });
                          loginUser();
                        } else {
                          if (mobileno.text.isEmpty || password.text.isEmpty) {
                            if (password.text.isEmpty) {
                              setState(() {
                                perror = "Password should not be empty";
                                merror = "";
                              });
                            }
                            if (mobileno.text.isEmpty) {
                              setState(() {
                                merror = "Mobile Number should not be empty";
                                perror = "";
                              });
                            } else if (mobileno.text.length > 1 &&
                                mobileno.text.length < 10) {
                              setState(() {
                                merror = "Enter valid Mobile Number";
                                if (password.text.isNotEmpty) {
                                  perror = "";
                                }
                              });
                            }
                            if (mobileno.text.isEmpty &&
                                password.text.isEmpty) {
                              setState(() {
                                perror = "password should not be empty";
                                merror = "Mobile number should not be empty";
                              });
                            }
                          }
                        }
                      },
                      child: Text(
                        "Login to account",
                        style: TextStyle(fontSize: 21, color: Colors.white),
                      )),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_screen(
                                        pageindex: 1,
                                      )));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 17, color: Colors.indigo),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
