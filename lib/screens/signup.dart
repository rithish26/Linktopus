import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:diyintern/screens/profile.dart';
import 'package:diyintern/screens/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'jobsearch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  String _email = "";
  String _password = "";
  String _confirm = "";
  int f = 0;
  final auth = FirebaseAuth.instance;
  bool isPasswordVisible = true;
  bool confirmpasword = true;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  /* Positioned(
                    top: size.height * (animation2.value + .58),
                    left: size.width * .21,
                    child: CustomPaint(
                      painter: MyPainter(50),
                    ),
                  ),
                  Positioned(
                    top: size.height * .98,
                    left: size.width * .1,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value - 30),
                    ),
                  ),
                  Positioned(
                    top: size.height * .5,
                    left: size.width * (animation2.value + .8),
                    child: CustomPaint(
                      painter: MyPainter(30),
                    ),
                  ),
                  Positioned(
                    top: size.height * animation3.value,
                    left: size.width * (animation1.value + .1),
                    child: CustomPaint(
                      painter: MyPainter(60),
                    ),
                  ),
                  Positioned(
                    top: size.height * .1,
                    left: size.width * .8,
                    child: CustomPaint(
                      painter: MyPainter(animation4.value),
                    ),
                  ), */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: (Text("Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Create new account to get started.",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),

                      SizedBox(
                        height: 80.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 10,
                              sigmaX: 10,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {},
                                    icon: Icon(Icons.email),
                                    color: Colors.black,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: 'Email Id',
                                hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _email = value.trim();
                                });
                              },
                              validator: (_email) => _email != null &&
                                      !EmailValidator.validate(_email)
                                  ? 'Enter a valid Email'
                                  : null,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 10,
                              sigmaX: 10,
                            ),
                            child: TextField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              obscureText: isPasswordVisible,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      if (isPasswordVisible) {
                                        setState(() {
                                          isPasswordVisible = false;
                                        });
                                      } else {
                                        setState(() {
                                          isPasswordVisible = true;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: 'Password(min 6 charecters)',
                                hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _password = value.trim();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 10,
                              sigmaX: 10,
                            ),
                            child: TextField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              obscureText: confirmpasword,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      if (confirmpasword) {
                                        setState(() {
                                          confirmpasword = false;
                                        });
                                      } else {
                                        setState(() {
                                          confirmpasword = true;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      confirmpasword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _confirm = value.trim();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xffCD225D),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black12,
                              ),
                            ),
                            onPressed: () async {
                              final form = formkey.currentState!;
                              if (form.validate()) {
                                if (_password == _confirm) {
                                  try {
                                    auth
                                        .createUserWithEmailAndPassword(
                                            email: _email, password: _password)
                                        .then((value) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyScreen()),
                                        (Route<dynamic> route) => false,
                                      );
                                    });
                                    if (_password.length < 6) {
                                      Alert(
                                          style: AlertStyle(
                                            backgroundColor: Color(0xff192028),
                                            overlayColor: Colors.transparent,
                                            animationType:
                                                AnimationType.fromTop,
                                            descStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            animationDuration:
                                                Duration(milliseconds: 400),
                                            alertBorder: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            titleStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          type: AlertType.error,
                                          context: context,
                                          title: "Error",
                                          desc:
                                              "Passoword length is less than 6 charecters",
                                          buttons: [
                                            DialogButton(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                color: Colors.white)
                                          ]).show();
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                } else if (_password != _confirm) {
                                  Alert(
                                      style: AlertStyle(
                                        backgroundColor: Color(0xff192028),
                                        overlayColor: Colors.transparent,
                                        animationType: AnimationType.fromTop,
                                        descStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        animationDuration:
                                            Duration(milliseconds: 400),
                                        alertBorder: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        titleStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      type: AlertType.error,
                                      context: context,
                                      title: "Error",
                                      desc: "Wrong Confirm Password",
                                      buttons: [
                                        DialogButton(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            color: Colors.white)
                                      ]).show();
                                }
                              }
                            },
                            child: Text(
                              'Sign-Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /* Container(
                                height: 40,
                                width: 220,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(40)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    final form = formkey.currentState!;
                                    if (form.validate()) {
                                      if (_password == _confirm) {
                                        auth
                                            .createUserWithEmailAndPassword(
                                                email: _email, password: _password)
                                            .then((value) {
                                          /* FirebaseFirestore.instance
                                    .collection('userdata')
                                    .doc(value.user.uid)
                                    .set({"email": value.user.email}); */
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VerifyScreen()));
                                        });
                                        /* if (newuser != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VerifyScreen()));
                              }
                              if (newuser == null) {
                                Navigator.pop(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Wrong confirm password'),
                                ),
                              );*/
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Wrong confirm password'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Sign-Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ), */
                      //            TextButton(
                      //              onPressed: () {
                      //                //Goto Forgot password logic
                      //              },
                      //              child: Text(
                      //                'Forgot Password?',
                      //                style: TextStyle(color: Colors.blue, fontSize: 15),
                      //              ),
                      //            ),
                      //            SizedBox(
                      //              height: 25.0,
                      //            ),
                      //            TextButton(
                      //              onPressed: () {
                      //                //Goto to singup page
                      //              },
                      //              child: Text(
                      //                'New User ? Create Account',
                      //                style: TextStyle(color: Colors.blue, fontSize: 15),
                      //              ),
                      //            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, String text) {
  return new AlertDialog(
    title: Text('Error',
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$text",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Close',
            style: TextStyle(
                color: Color(0xff192028),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
