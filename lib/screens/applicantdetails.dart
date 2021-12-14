import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/profilescreen.dart';
import 'package:diyintern/screens/searchservice.dart';
import 'package:flutter/material.dart';

class JobApplicantDetails extends StatefulWidget {
  String jobid = "";
  JobApplicantDetails({required this.jobid});
  @override
  _JobApplicantDetailsState createState() => _JobApplicantDetailsState();
}

class _JobApplicantDetailsState extends State<JobApplicantDetails> {
  String username = "";
  var queryResultSet = [];
  var tempsearchstore = [];
  getusername() {
    queryResultSet = [];
    tempsearchstore = [];

    FirebaseFirestore.instance
        .collection('JOBS')
        .doc(widget.jobid)
        .collection('applicants')
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
    super.initState();
    getusername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff383799),
        title: Text(
          'Job Applicant Details',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.all(20),
          primary: true,
          shrinkWrap: true,
          children: tempsearchstore.map((element) {
            /*  String name = "";
            String skill = "";
            FirebaseFirestore.instance
                .collection("userdata")
                .doc('${element['applicantid']}')
                .get()
                .then((value) {
              name = value['lastname'];
              
              skill = value['skills'];
            }); */
            return buildResultCard(context, element);
          }).toList()),
      /* Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 80,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name:  Krishna',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'job: Frontend Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 80,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name:  Harsh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'job: Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 80,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name:  Maheshwar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'job: Dart Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 80,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name:  Ramesh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'job: Web Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 80,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name:  Suresh',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'job: Python Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ), */
    );
  }
}

Widget buildResultCard(
  BuildContext context,
  data,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: GestureDetector(
              child: ListTile(
                hoverColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Color(0xff383799),
                focusColor: Colors.green,
                leading: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Colors.white,
                ),
                title: Text(
                  data['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                subtitle: Text(
                  data['skill'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(refid: data['applicantid'])),
                );
              }),
        ),
        SizedBox(
          height: 2.0,
        ),
      ],
    ),
  );
  /* return SingleChildScrollView(
    child: Column(
      children: [
        GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 80,
              padding: EdgeInsets.only(top: 18.0),
              child: Column(children: [
                Center(
                  child: Text(
                    'Name:${data['name']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Center(
                  child: Text(
                    'job: ${data['skill']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(refid: data['applicantid'])),
            );
          },
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  ); */
}
