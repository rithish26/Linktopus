import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/applicantdetails.dart';
import 'package:diyintern/screens/jobapply.dart';
import 'package:diyintern/screens/jobpost.dart';
import 'package:diyintern/screens/login.dart';
import 'package:diyintern/screens/searchservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'jobsort.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  var queryResultSet = [];
  var tempsearchstore = [];

  initiateSearch() {
    queryResultSet = [];
    tempsearchstore = [];

    return FirebaseFirestore.instance
        .collection('JOBS')
        .orderBy('time')
        .get()
        .then((QuerySnapshot docse) {
      for (int i = 0; i < docse.docs.length; ++i) {
        queryResultSet.add(docse.docs[i].data());
        setState(() {
          print(queryResultSet[i]);
          tempsearchstore.add(queryResultSet[i]);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xffCD225D),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobPost()),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            backgroundColor: Color(0xffCD225D),
            child: Icon(
              Icons.analytics,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobSort()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff383799),
        leading: IconButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.logout)),
        title: (Text(
          'JOB LIST',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView(
          padding: EdgeInsets.all(20),
          primary: true,
          shrinkWrap: true,
          children: tempsearchstore.reversed.map((element) {
            return buildResultCard(context, element);
          }).toList()),
      /* Padding(
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 50,
                    child: const Center(
                        child: Text('Sofeware Engineer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobApplicantDetails()),
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Frontend Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Backend Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Content writer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Product manager',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Java Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Python Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Software Developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('Flutter developer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 50,
                  child: const Center(
                      child: Text('intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
                SizedBox(height: 60.0),
              ],
            ),
          ),
        ), */
    );
  }
}

Widget buildResultCard(BuildContext context, data) {
  return SingleChildScrollView(
    child: Column(
      children: [
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff383799),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              height: 70,
              child: Center(
                  child: Text(data['jobtitle'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobApply(
                    jobtitle: data['jobtitle'],
                    jobdisc: data['jobdisc'],
                    qualification: data['qualification'],
                    websitelink: data['websitelink'],
                    isadmin: true,
                    companyname: data['companyname'],
                    refid: data['refid'],
                    email: data['emaillink'],
                    aboutcompany: data['aboutcompany'],
                    isprev: false,
                    skills: data['skills'],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}
