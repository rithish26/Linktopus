import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'jobapply.dart';
import 'joblist.dart';

class Jobeditpost extends StatefulWidget {
  String jobtitle = "";
  String jobdisc = "";
  String qualification = "";
  String websitelink = "";
  bool isadmin = false;
  String companyname = "";
  String refid = "";
  String email = "";
  String aboutcompany = "";
  String skill = "";
  Jobeditpost({
    required this.jobtitle,
    required this.jobdisc,
    required this.qualification,
    required this.websitelink,
    required this.isadmin,
    required this.companyname,
    required this.refid,
    required this.email,
    required this.aboutcompany,
    required this.skill,
  });
  @override
  _JobeditpostState createState() => _JobeditpostState();
}

class _JobeditpostState extends State<Jobeditpost> {
  final auth = FirebaseAuth.instance;
  late User user;

  String email = "";
  String companyname = "";
  String jobtitle = "";
  String jobdisc = "";
  String aboutcomp = "";
  String qualification = "";
  String websitelink = "";
  String skill = "";
  @override
  void initState() {
    super.initState();
    email = widget.email;
    companyname = widget.companyname;
    jobtitle = widget.jobtitle;
    jobdisc = widget.jobdisc;
    aboutcomp = widget.aboutcompany;
    qualification = widget.qualification;
    websitelink = widget.websitelink;
    skill = widget.skill;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: (Text(
          'Edit Job Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.blue[900],
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
                  child: TextFormField(
                    initialValue: companyname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue[900],
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
                TextFormField(
                  initialValue: jobtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
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
                TextFormField(
                  maxLines: 4,
                  initialValue: jobdisc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
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
                TextFormField(
                  maxLines: 4,
                  initialValue: aboutcomp,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
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
                TextFormField(
                  maxLines: 1,
                  initialValue: skill,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
                    filled: true,
                    labelText: 'Key Skills',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: '',
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
                      skill = value.trim();
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  initialValue: qualification,
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
                    fillColor: Colors.blue[900],
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
                TextFormField(
                  initialValue: email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
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
                TextFormField(
                  initialValue: websitelink,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue[900],
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
                SizedBox(height: 10.0),
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
                      final ref = FirebaseFirestore.instance
                          .collection('JOBS')
                          .doc(widget.refid);
                      ref.update({
                        "companyname": companyname,
                        "jobtitle": jobtitle,
                        "jobtitlekey": jobtitle.toLowerCase(),
                        "jobdisc": jobdisc,
                        "aboutcompany": aboutcomp,
                        "qualification": qualification,
                        "qualificationkey": qualification.toLowerCase(),
                        "emaillink": email,
                        "websitelink": websitelink,
                        "searchkey": jobtitle[0],
                        "skillskey": skill.toLowerCase(),
                        "skills": skill,
                        "refid": ref.id,
                      });

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => JobList()));
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                            skills: skill,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Preview',
                      style: TextStyle(
                        color: Colors.blue[900],
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
