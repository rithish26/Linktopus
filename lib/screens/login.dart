import 'dart:async';
import 'dart:core';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/resetscreen.dart';
import 'package:diyintern/screens/verify.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diyintern/screens/joblist.dart';
import 'package:diyintern/screens/jobpost.dart';
import 'package:diyintern/screens/jobsearch.dart';
import 'package:diyintern/screens/profile.dart';
import 'package:diyintern/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  String _email = "";
  String _password = "";
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String admin_email = "devarithish26@gmail.com";
  String admin_password = "1001";
  bool isPasswordVisible = true;
  ontap() {}
  @override
  void initState() {
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
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var collection = FirebaseFirestore.instance.collection('userdata');
      collection.doc(user.uid).get().then((value) {
        if (value.exists) {
          if (user.emailVerified) {
            /* //if there isn't any user currentUser function returns a null so we should check this case.
      Navigator.pushReplacement(
          // we are making YourHomePage widget the root if there is a user.
          context,
          MaterialPageRoute(builder: (context) => JobSearch())); */
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => JobSearch()),
                (Route<dynamic> route) => false,
              );
            });
          }
        }
      });
    }
  }

  bool isloading = false;
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
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ), */
      body: Container(
        /* decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff192028)],
          ),
        ), */
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 270.0,
                          width: 300.0,
                          padding: EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Center(
                            child: Image.asset(
                                'assets/images/Linktopusnotitle .png'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
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
                                  contentPadding: EdgeInsets.all(20),
                                  /*    fillColor: Colors.blue[900],
                                  filled: true, */
                                  border: OutlineInputBorder(),
                                  hintText: 'E-mail Id',
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
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                                  hintText: 'Password',
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isloading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  )))
                                : Container(
                                    height: size.width / 8,
                                    width: size.width / 2.58,
                                    decoration: BoxDecoration(
                                        color: Color(0xffCD225D),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => Colors.black12,
                                        ),
                                      ),
                                      onPressed: () async {
                                        HapticFeedback.lightImpact();
                                        try {
                                          if (_email == admin_email &&
                                              _password == admin_password) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => JobList()));
                                          } else {
                                            final form = formkey.currentState!;
                                            if (form.validate()) {
                                              setState(() {
                                                isloading = true;
                                              });
                                              await auth
                                                  .signInWithEmailAndPassword(
                                                      email: _email,
                                                      password: _password);
                                              final usere = auth.currentUser;
                                              var collection = FirebaseFirestore
                                                  .instance
                                                  .collection('userdata');
                                              var docSnapshot = await collection
                                                  .doc(usere.uid)
                                                  .get();

                                              if (usere != null &&
                                                  docSnapshot.exists) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          JobSearch()),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                                Fluttertoast.showToast(
                                                    msg: 'Welcome Back!!');

                                                setState(() {
                                                  isloading = false;
                                                });
                                              } else if (!usere.emailVerified &&
                                                  usere != null) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VerifyScreen()),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );

                                                Fluttertoast.showToast(
                                                    msg: 'Not verified');
                                              } else if (!docSnapshot.exists &&
                                                  usere != null) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Profile(true)),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );

                                                Fluttertoast.showToast(
                                                    msg: 'Data Missing');
                                                setState(() {
                                                  isloading = false;
                                                });
                                              }
                                            }
                                          }
                                        } catch (e) {
                                          print(e);

                                          Alert(
                                              style: AlertStyle(
                                                backgroundColor:
                                                    Color(0xff192028),
                                                overlayColor:
                                                    Colors.transparent,
                                                animationType:
                                                    AnimationType.fromTop,
                                                descStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                animationDuration:
                                                    Duration(milliseconds: 400),
                                                alertBorder:
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  side: BorderSide(
                                                      color: Colors.black),
                                                ),
                                                titleStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              type: AlertType.error,
                                              context: context,
                                              title: "Error",
                                              desc:
                                                  "Wrong Password or Mail Address",
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

                                          setState(() {
                                            isloading = false;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(width: size.width / 20),
                            Container(
                              height: size.width / 8,
                              width: size.width / 2.58,
                              decoration: BoxDecoration(
                                  color: Color(0xffCD225D),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.black12,
                                  ),
                                ),
                                onPressed: () async {
                                  HapticFeedback.lightImpact();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ResetScreen()));
                                },
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          width: 300,
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
                              HapticFeedback.lightImpact();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                            },
                            child: Text(
                              'New User ? Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        /* Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final form = formkey.currentState!;
                              if (form.validate()) {
                                final user = await auth.signInWithEmailAndPassword(
                                    email: _email, password: _password);
                                if (user != null) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (_) => JobSearch()));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Wrong password or username'),
                                  ));
                                }
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ), */
                        SizedBox(
                          height: 10.0,
                        ),
                        /* Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              if (_email == admin_email &&
                                  _password == admin_password) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (_) => JobList()));
                              } else {
                                final form = formkey.currentState!;
                                if (form.validate()) {
                                  final user = await auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);
                                  if (user != null) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (_) => JobSearch()));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Wrong password or username'),
                                    ));
                                  }
                                }
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Admin Login',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ), */
                        /*  TextButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ResetScreen())),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        /*  SizedBox(
                        height: 15.0,
                      ), */
                        TextButton(
                          onPressed: () {
                           
                          },
                          child: Text(
                            'New User ? Create Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // ignore: dead_code
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

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(colors: [
        Color(0xff383799),
        Color(0xffCD225D),
        /*  Color(0xff7F2E6A),
        Color(0xff6D2F70),
        Color(0xff622F73),
        Color(0xff573176),
        Color(0xff42317D), */
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
