import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/applicantdetails.dart';
import 'package:diyintern/screens/jobpost.dart';
import 'package:diyintern/screens/searchservice.dart';
import 'package:flutter/material.dart';

class JobSort extends StatefulWidget {
  @override
  _JobSortState createState() => _JobSortState();
}

class _JobSortState extends State<JobSort> {
  var queryResultSet = [];
  var tempsearchstore = [];
  int datavalue = 0;
  initiateSearch() {
    queryResultSet = [];
    tempsearchstore = [];

    return FirebaseFirestore.instance
        .collection('JOBS')
        .orderBy('applications')
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

  /* getentries() async {
    QuerySnapshot productCollection = await FirebaseFirestore.instance
        .collection('JOBS')
        .doc(widget.refid)
        .collection('applicants')
        .get();
    int productCount = productCollection.size;
    datavalue = productCount;
  }
 */
  @override
  void initState() {
    super.initState();

    initiateSearch();
  }

  nonsearchdata() {
    return ListView(
        padding: EdgeInsets.all(20),
        primary: true,
        shrinkWrap: true,
        children: tempsearchstore.reversed.map((element) {
          return buildResultCard(context, element);
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffCD225D),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => JobPost()));
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff383799),
        title: Text(
          'Job Applicants',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: nonsearchdata(),
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
                  height: 70,
                  padding: EdgeInsets.only(top: 18.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Job:  Software Engineer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Entries: 8',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Frontend Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 22',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Backend Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 12',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Intern',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 33',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Content writer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 4',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Product Manager',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 6',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Java Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 18',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Python Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 11',
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
                height: 70,
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Job:  Software Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Entries: 23',
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
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
 */
    );
  }
}

Widget buildResultCard(BuildContext context, data) {
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
                  Icons.work,
                  color: Colors.white,
                ),
                title: Text(
                  data['jobtitle'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  data['applications'] == null
                      ? 'Entries:0'
                      : 'Entries:${data['applications']}',
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
                      builder: (context) => JobApplicantDetails(
                            jobid: data['refid'],
                          )),
                );
              }),
        ),
        SizedBox(
          height: 2.0,
        ),
      ],
    ),
  );
  /* SingleChildScrollView(
    child: Column(
      children: [
        GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 70,
              padding: EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Job:${data['jobtitle']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Entries: ${data['applications']}',
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobApplicantDetails(
                          jobid: data['refid'],
                        )),
              );
            }),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  ); */
}
