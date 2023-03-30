import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible1 = true;
    passwordVisible2 = true;
  }

  final usernamec = TextEditingController();
  final emailc = TextEditingController();
  final mobilenoc = TextEditingController();
  final password1c = TextEditingController();
  final password2c = TextEditingController();
  String username = "";
  String email = "";
  String mobno = "";
  String passwd = "";
  String cpasswd = "";
  String status = "";
  String uerror = "";
  String eerror = "";
  String merror = "";
  String perror1 = "";
  String perror2 = "";

  void registerUser() async {
    var url = 'http://192.168.103.166/Auth/register.php';
    var response = await http.post(Uri.parse(url), body: {
      'username': username,
      'email': email,
      'mob': mobno,
      'password': passwd,
    });
    print(jsonDecode(response.body));
    if (jsonDecode(response.body) == "Success") {
      usernamec.clear();
      emailc.clear();
      mobilenoc.clear();
      password1c.clear();
      password2c.clear();
    }
  }

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
                      height: height * 0.04,
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
                        controller: usernamec,
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
                            labelStyle:
                                TextStyle(color: Colors.indigo, fontSize: 18.0),
                            errorText: uerror,
                            errorBorder: uerror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: uerror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        controller: emailc,
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
                            labelStyle:
                                TextStyle(color: Colors.indigo, fontSize: 18.0),
                            errorText: eerror,
                            errorBorder: eerror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: eerror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        controller: mobilenoc,
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
                            labelStyle:
                                TextStyle(color: Colors.indigo, fontSize: 18.0),
                            errorText: merror,
                            errorBorder: merror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: merror == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
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
                        controller: password1c,
                        obscureText: passwordVisible1,
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible1 = !passwordVisible1;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.indigo,
                                )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                            labelText: "PASSWORD",
                            labelStyle:
                                TextStyle(color: Colors.indigo, fontSize: 18.0),
                            errorText: perror1,
                            errorBorder: perror1 == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: perror1 == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: TextField(
                        controller: password2c,
                        obscureText: passwordVisible2,
                        cursorWidth: 0,
                        cursorHeight: 0,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible2 = !passwordVisible2;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.indigo,
                                )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                            labelText: "CONFIRM PASSWORD",
                            labelStyle:
                                TextStyle(color: Colors.indigo, fontSize: 18.0),
                            errorText: perror2,
                            errorBorder: perror2 == ""
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: perror2 == ""
                                ? UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue))
                                : UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
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
                            onPressed: () {
                              setState(() {
                                username = usernamec.text;
                                email = emailc.text;
                                mobno = mobilenoc.text;
                                passwd = password1c.text;
                                cpasswd = password2c.text;
                              });
                              setState(() {
                                uerror = "";
                                eerror = "";
                                merror = "";
                                perror1 = "";
                                perror2 = "";
                              });
                              if (username.isNotEmpty &&
                                  email.isNotEmpty &&
                                  mobno.isNotEmpty &&
                                  passwd.isNotEmpty &&
                                  cpasswd.isNotEmpty &&
                                  passwd == cpasswd &&
                                  EmailValidator.validate(email) &&
                                  mobno.length == 10) {
                                registerUser();
                              } else {
                                if (username.isEmpty) {
                                  setState(() {
                                    uerror = "Username should not be empty";
                                  });
                                }
                                if (email.isEmpty) {
                                  setState(() {
                                    eerror = "Email should not be empty";
                                  });
                                }
                                if (!EmailValidator.validate(email)) {
                                  setState(() {
                                    eerror = "Enter Valid Email";
                                  });
                                }
                                if (mobno.isEmpty) {
                                  setState(() {
                                    merror =
                                        "Mobile Number should not be empty";
                                  });
                                }
                                if (merror.isEmpty && mobno.length < 10) {
                                  merror = "Enter Valid Mobile Number";
                                }
                                if (passwd.isEmpty) {
                                  setState(() {
                                    perror1 = "Password should not be empty";
                                  });
                                }
                                if (cpasswd.isEmpty) {
                                  setState(() {
                                    perror2 = "Password should not be empty";
                                  });
                                }
                                if (passwd != cpasswd) {
                                  setState(() {
                                    perror2 = "Password not matched";
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            )),
                      )),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
