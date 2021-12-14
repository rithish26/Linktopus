import 'dart:async';
import 'dart:ui';

import 'package:diyintern/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'jobsearch.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  String refid = "";

  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _mobilenumber = TextEditingController();
  final TextEditingController _jobexperience = TextEditingController();
  final TextEditingController _skills = TextEditingController();
  final TextEditingController _currentrole = TextEditingController();
  final TextEditingController _username = TextEditingController();

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
    user = auth.currentUser;
    refid = user.uid;
    FirebaseFirestore.instance
        .collection('userdata')
        .doc(refid)
        .get()
        .then((value) {
      _name.text = value['firstname'];

      _lastname.text = value['lastname'];
      _mobilenumber.text = value['mobilenumber'];
      _jobexperience.text = value['job experience'];
      _skills.text = value['skills'];
      _currentrole.text = value['current role'];
      _username.text = value['username'];
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    controller1.dispose();
    controller2.dispose();
    _lastname.dispose();
    _currentrole.dispose();
    _jobexperience.dispose();
    _skills.dispose();
    _currentrole.dispose();
    _username.dispose();

    super.dispose();
  }

  _logOut() async {
    await FirebaseAuth.instance.signOut().then((_) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginPage()));
      });
      /*  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    }); */
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                _logOut();
              },
              icon: Icon(Icons.logout)),
        ],
        backgroundColor: Colors.white,
        title: (Text(
          'User Profile',
          style: TextStyle(color: Colors.black),
        )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 00.0, right: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: (Text("Edit Profile",
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
                      height: 20.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _name,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _lastname,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _username,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _mobilenumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
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
                            labelStyle: TextStyle(color: Colors.black),
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _jobexperience,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
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
                            labelStyle: TextStyle(color: Colors.black),
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _skills,
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
                                icon: Icon(Icons.computer),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TextField(
                          controller: _currentrole,
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
                                icon: Icon(Icons.contacts),
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
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
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
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
                          if (user.email == "" ||
                              _name.text == "" ||
                              _lastname.text == "" ||
                              _mobilenumber.text == "" ||
                              _jobexperience.text == "" ||
                              _skills.text == "" ||
                              _currentrole.text == "" ||
                              _username.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Some empty feilds'),
                              ),
                            );
                          } else {
                            final ref = FirebaseFirestore.instance
                                .collection('userdata')
                                .doc(user.uid);
                            ref.update({
                              "email": user.email,
                              "firstname": _name.text,
                              "lastname": _lastname.text,
                              "mobilenumber": _mobilenumber.text,
                              "job experience": _jobexperience.text,
                              "skills": _skills.text,
                              "current role": _currentrole.text,
                              "username": _username.text,
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
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
