import 'package:diyintern/screens/jobapply.dart';
import 'package:diyintern/screens/joblist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/jobsearch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class JobPost extends StatefulWidget {
  @override
  _JobPostState createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  final auth = FirebaseAuth.instance;
  late User user;
  String email = "";
  String companyname = "";
  String jobtitle = "";
  String jobdisc = "";
  String aboutcomp = "";
  String qualification = "";
  String websitelink = "";
  String key = "";
  String skills = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff383799),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: (Text(
          'Post A Job',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Color(0xff383799),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, right: 20.0, bottom: 20.0, left: 20.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(),
                      fillColor: Color(0xff383799),
                      filled: true,
                      labelText: 'Company name',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      hintText: 'Enter Name of company',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        companyname = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'Job title',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter the job title',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      jobtitle = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 5,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'Job description',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter Job Description',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      jobdisc = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 5,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'About company',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'About the company',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      aboutcomp = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'Skills',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Skills',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
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
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 5,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'Qualifications',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter the required qualification',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      qualification = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'email link',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter the mail id',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Color(0xff383799),
                    filled: true,
                    labelText: 'Website link',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter the website link',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      websitelink = value.trim();
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black12,
                      ),
                    ),
                    onPressed: () async {
                      final ref =
                          FirebaseFirestore.instance.collection('JOBS').doc();
                      ref.set({
                        "companyname": companyname,
                        "jobtitle": jobtitle,
                        "jobtitlekey": jobtitle.toLowerCase(),
                        "qualificationkey": qualification.toLowerCase(),
                        "jobdisc": jobdisc,
                        "aboutcompany": aboutcomp,
                        "qualification": qualification,
                        "emaillink": email,
                        "websitelink": websitelink,
                        "refid": ref.id,
                        "skills": skills,
                        "skillskey": skills.toLowerCase(),
                        "applications": 0,
                        "time": new DateTime.now()
                      });

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => JobList()));
                    },
                    child: Text(
                      'POST',
                      style: TextStyle(
                        color: Color(0xff383799),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black12,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobApply(
                            jobtitle: jobtitle,
                            jobdisc: jobdisc,
                            qualification: qualification,
                            websitelink: websitelink,
                            isadmin: true,
                            companyname: companyname,
                            refid: 'xyz',
                            email: email,
                            aboutcompany: aboutcomp,
                            isprev: true,
                            skills: skills,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'PREVIEW',
                      style: TextStyle(
                        color: Color(0xff383799),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
