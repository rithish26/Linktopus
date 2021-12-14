import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/jobeditpost.dart';
import 'package:diyintern/screens/joblist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import 'searchservice.dart';

Widget Apply = Container(
  padding: EdgeInsets.all(3),
);

Widget Title = Container(
  padding: const EdgeInsets.all(5),
  child: const Text(
    'Job : Full Stack Developer',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    softWrap: true,
  ),
);

Widget Website = Container(
  padding: const EdgeInsets.all(3),
  child: const Text(
    'www.websitename.com',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    softWrap: true,
  ),
);

Widget Responsibility = Container(
  padding: const EdgeInsets.all(12),
  child: const Text(
    'Responsibilities\n'
    '1.Write clean, maintainable, and efficient code\n'
    '2.Design robust, scalable, and secure features\n'
    '3.Contribute in all phases of the development lifecycle.\n',
    softWrap: true,
    style: TextStyle(fontSize: 18.0),
  ),
);

Widget Requirements = Container(
  padding: const EdgeInsets.all(12),
  child: const Text(
    'Required Technical and Professional Expertise\n'
    '• 5 + years of experience in software development, agile processes for Product development.\n'
    '• Should be extremely hands-on, full-stack developer with expertise on cloud architecture.\n'
    '• Expertise in Java EE programming, solid understanding of multi-tiered web-based applications\n',
    softWrap: true,
    style: TextStyle(fontSize: 18.0),
  ),
);

class JobApply extends StatefulWidget {
  String jobtitle = "";
  String jobdisc = "";
  String qualification = "";
  String websitelink = "";
  bool isadmin = false;
  String companyname = "";
  String refid = "";
  String email = "";
  String aboutcompany;
  bool isprev = false;
  String skills;
  JobApply({
    required this.jobtitle,
    required this.jobdisc,
    required this.qualification,
    required this.websitelink,
    required this.isadmin,
    required this.companyname,
    required this.refid,
    required this.email,
    required this.aboutcompany,
    required this.isprev,
    required this.skills,
  });
  Color c1 = const Color(0x00FFFFFF);
  @override
  _JobApplyState createState() => _JobApplyState();
}

class _JobApplyState extends State<JobApply> {
  final auth = FirebaseAuth.instance;
  late User user;
  int datavalue = 0;
  getentries() async {
    QuerySnapshot productCollection = await FirebaseFirestore.instance
        .collection('JOBS')
        .doc(widget.refid)
        .collection('applicants')
        .get();
    int productCount = productCollection.size;
    datavalue = productCount;
  }

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: (Text('Job Apply')),
        backgroundColor: Color(0xff383799),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCD225D),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 5),
                    ],
                  ),
//                  color: Color(0xffE2E2E2),

                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${widget.jobtitle.toUpperCase()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Text(
                            'Responsibilities:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: Text(
                            '${widget.jobdisc.replaceAll('\\n', '\n')}',
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Text(
                            'Key Skills',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: Text(
                            '${widget.skills.replaceAll('\\n', '\n')}',
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Text(
                            'Requirements:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: Text(
                            '${widget.qualification.replaceAll('\\n', '\n')}',
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Text(
                            'Email Link:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: Text(
                            '${widget.email}',
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: Text(
                            'About Company:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: Text(
                            '${widget.aboutcompany}',
                            softWrap: true,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Container(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          '${widget.companyname}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
//                Container(
//                  height: 50,
//                  width: 250,
//                  decoration: BoxDecoration(
//                      color: Colors.red,
//                      borderRadius: BorderRadius.circular(20)),
//                  child: ElevatedButton(
//                    style: ElevatedButton.styleFrom(
//                        primary: Colors.purple,
//                        textStyle: TextStyle(
//                            fontSize: 30, fontWeight: FontWeight.bold)),
//                    onPressed: () {},
//                    child: Text(
//                      'Apply Via E-Mail',
//                      style: TextStyle(color: Colors.white, fontSize: 25),
//                    ),
//                  ),
//                ),
                const SizedBox(
                  height: 25.0,
                ),
//                const Text(
//                  "OR",
//                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
//                ),
                widget.isprev
                    ? Container()
                    : widget.isadmin
                        ? Container()
                        : Container(
                            height: 60,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xff383799),
                                borderRadius: BorderRadius.circular(50)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0,
                                  primary: Color(0xff383799),
                                  textStyle: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                //here we put the route to our home page with list of jobs
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (_) => HomePage()));
                              },
                              child: MaterialButton(
                                onPressed: () async {
                                  String name = "";
                                  String skill = "";
                                  await FirebaseFirestore.instance
                                      .collection("userdata")
                                      .doc(user.uid)
                                      .get()
                                      .then((value) {
                                    name = value['lastname'];
                                    skill = value['skills'];
                                  });
                                  FirebaseFirestore.instance
                                      .collection('JOBS')
                                      .doc(widget.refid)
                                      .collection('applicants')
                                      .doc(user.uid)
                                      .set({
                                    'applicant email': user.email,
                                    'applicantid': user.uid,
                                    'name': name,
                                    'skill': skill,
                                  }, SetOptions(merge: true));
                                  await getentries();

                                  FirebaseFirestore.instance
                                      .collection('JOBS')
                                      .doc(widget.refid)
                                      .set({'applications': datavalue},
                                          SetOptions(merge: true));
                                  FirebaseFirestore.instance
                                      .collection('userdata')
                                      .doc(auth.currentUser.uid)
                                      .collection('applications')
                                      .doc(widget.refid)
                                      .set({
                                    'company name': widget.companyname,
                                    'job title': widget.jobtitle,
                                    'job disc': widget.jobdisc,
                                    'qualification': widget.qualification,
                                    'websitelink': widget.websitelink,
                                    'refid': widget.refid,
                                    'emaillink': widget.email,
                                    'aboutcompany': widget.aboutcompany,
                                    'time': new DateTime.now()
                                  }, SetOptions(merge: true));
                                  _launchUrl('https://${widget.websitelink}');
                                },
                                child: Center(
                                  child: Text(
                                    'Apply Link',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    //                        textAlign: ,
                                  ),
                                ),
                              ),
                            ),
                          ),
                SizedBox(
                  height: 10,
                ),
                widget.isprev
                    ? Container()
                    : widget.isadmin
                        ? Container(
                            height: 60,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xff383799),
                                borderRadius: BorderRadius.circular(50)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0,
                                  primary: Color(0xff383799),
                                  textStyle: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                //here we put the route to our home page with list of jobs
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (_) => HomePage()));
                              },
                              child: MaterialButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("JOBS")
                                      .doc(widget.refid)
                                      .delete();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => JobList()));
                                },
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    //                        textAlign: ,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                SizedBox(
                  height: 10,
                ),
                widget.isprev
                    ? Container()
                    : widget.isadmin
                        ? Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xff383799),
                                borderRadius: BorderRadius.circular(50)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 15.0,
                                  primary: Color(0xff383799),
                                  textStyle: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {},
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Jobeditpost(
                                                jobtitle: widget.jobtitle,
                                                jobdisc: widget.jobdisc,
                                                qualification:
                                                    widget.qualification,
                                                websitelink: widget.websitelink,
                                                isadmin: widget.isadmin,
                                                companyname: widget.companyname,
                                                refid: widget.refid,
                                                email: widget.email,
                                                aboutcompany:
                                                    widget.aboutcompany,
                                                skill: widget.skills,
                                              )));
                                },
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                    //                        textAlign: ,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchUrl(String urlString) async {
    try {
      await launch(
        urlString,
      );
    } catch (e) {
      print(e);
    }
    /* if (await canLaunch(urlString)) {
      await launch(
        urlString,
        forceWebView: true,
      );
    } else {
      print(urlString);
      print("Can\'t Launch Url");
    }*/
  }
}
