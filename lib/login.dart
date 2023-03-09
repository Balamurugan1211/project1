import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    cursorHeight: 0,
                    cursorWidth: 0,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo)),
                      prefixIcon: Icon(Icons.phone, color: Colors.indigo),
                      labelText: "MOBILE NUMBER",
                      labelStyle: TextStyle(color: Colors.indigo, fontSize: 18),
                    ),
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
                      onPressed: () {},
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
                        onPressed: () {},
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
