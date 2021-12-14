import 'dart:async';
import 'dart:ui';

import 'package:diyintern/screens/login.dart';
import 'package:diyintern/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen>
    with TickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
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
            type: AlertType.success,
            context: context,
            title: "Tip",
            desc: "Please wait on this screen  after verifying for 5 seconds")
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
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
    _showDialog();
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
    timer.cancel();
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
        elevation: 0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Verify',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            /*  Positioned(
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
                Center(
                  child: Container(
                    height: 270.0,
                    width: 300.0,
                    padding: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/542239-200.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      (Text("Verification link has been sent to ${user.email}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff383799),
                          Color(0xffCD225D),
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.black12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'Back to Login!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Profile(false)),
        (Route<dynamic> route) => false,
      );
      Fluttertoast.showToast(msg: 'Welcome!!');
    }
  }
}
