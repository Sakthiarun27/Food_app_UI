// ignore_for_file: prefer_const_constructors

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
// import 'dart:core' as core;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/colors.dart';
import 'package:foodapp/home_screen.dart';
// import 'package:foodapp/home_screen.dart';

// void main() {
//    runApp(loginscreen());
// }

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? _email, _password;

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/food_bg.jpg',
                        height: height * 0.40,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: height * 0.42,
                        width: width,
                        // color: Colors.white.withOpacity(0.3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white])),
                      ),
                    ],
                  ),
                  Center(
                    child: const Text(
                      'Foodie',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Center(
                    child: const Text(
                      'Delivery app',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Container(
                      child: Text(
                        '  Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            primaryColor.withOpacity(0.3),
                            primaryColor.withOpacity(0.1)
                          ]),
                          border: Border(
                              left: BorderSide(color: primaryColor, width: 5))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (email) {
                        if (email == null || email.isEmpty)
                          return "Please enter email";
                        else if (!RegExp(
                                r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                            .hasMatch(email)) return "Enter valid email";
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          labelText: "Email Address",
                          labelStyle:
                              TextStyle(color: primaryColor, fontSize: 16)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return "Enter the password";
                        } else if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,}$',
                        ).hasMatch(password))
                          return "Enter valid password";
                        else
                          return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor)),
                          prefixIcon: Icon(
                            Icons.lock_open_sharp,
                            color: primaryColor,
                          ),
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: primaryColor, fontSize: 16)),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.black),
                          ))),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                        height: height * 0.08,
                        width: width - 30,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff08c105)),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              if (formkey.currentState?.validate() == true) {
                                formkey.currentState?.save();
                                if (_email == "test@gmail.com" &&
                                    _password == "Root@123") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              'Login to account',
                              style: TextStyle(fontSize: 23),
                            ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
