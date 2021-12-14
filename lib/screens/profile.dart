import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/jobsearch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login.dart';

class Profile extends StatefulWidget {
  bool flag;
  Profile(this.flag);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  late User user;
  String email = "";
  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    Alert(
            style: AlertStyle(
              backgroundColor: Color(0xff192028),
              overlayColor: Colors.transparent,
              animationType: AnimationType.fromTop,
              descStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              animationDuration: Duration(milliseconds: 400),
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
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
            desc: "Data missing")
        .show();
  }

  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  @override
  void initState() {
    user = auth.currentUser;
    email = user.email;
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
    if (widget.flag) {
      _showDialog();
    }
    controller2.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  String name = "";
  String lastname = "";
  String mobilenumber = "";
  String jobexperience = "";
  String skills = "";
  String currentrole = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
          'User Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 00.0, right: 20.0),
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
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: (Text("Almost there!!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                    ),
                    /* Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.blue[200],
                      backgroundImage: AssetImage('assets/images/542239-200.png'),
                    ),
                  ), */
                    SizedBox(
                      height: 18.0,
                    ),
                    ClipRRect(
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
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.account_box),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter your First name',
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
                              name = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.account_circle_outlined),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter your Last name',
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
                              lastname = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.account_circle_sharp),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Enter your Username',
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
                              username = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.add_call),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'Enter your Phone number',
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
                              mobilenumber = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.add_chart_outlined),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'Enter your Job experience',
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
                              jobexperience = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.computer),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'Enter your Skills',
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
                              skills = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 10,
                          sigmaX: 10,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(Icons.contacts),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'Enter your Current Role',
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
                              currentrole = value.trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff383799),
                            Color(0xffCD225D),
                          ]),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black12,
                          ),
                        ),
                        onPressed: () async {
                          if (user.email == "" ||
                              name == "" ||
                              lastname == "" ||
                              mobilenumber == "" ||
                              jobexperience == "" ||
                              skills == "" ||
                              currentrole == "" ||
                              username == "") {
                            Alert(
                                style: AlertStyle(
                                  backgroundColor: Color(0xff192028),
                                  overlayColor: Colors.transparent,
                                  animationType: AnimationType.fromTop,
                                  descStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  animationDuration:
                                      Duration(milliseconds: 400),
                                  alertBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  titleStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                context: context,
                                title: "Error",
                                desc: "Empty feilds",
                                buttons: [
                                  DialogButton(
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Color(0xff192028),
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      color: Colors.black)
                                ]);
                            Fluttertoast.showToast(msg: 'Some empty feilds');
                          } else {
                            final ref = FirebaseFirestore.instance
                                .collection('userdata')
                                .doc(user.uid);
                            ref.set({
                              "email": user.email,
                              "firstname": name,
                              "lastname": lastname,
                              "mobilenumber": mobilenumber,
                              "job experience": jobexperience,
                              "skills": skills,
                              "current role": currentrole,
                              "username": username,
                              "role": 'notadmin',
                              "verified": true,
                              "userid": user.uid,
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JobSearch()));
                          }
                        },
                        child: Text(
                          'DONE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
