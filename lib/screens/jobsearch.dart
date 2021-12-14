import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyintern/screens/appliedjobs.dart';
import 'package:diyintern/screens/editprofile.dart';
import 'package:diyintern/screens/login.dart';
import 'package:diyintern/screens/searchservice.dart';
import 'package:diyintern/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'jobapply.dart';

class JobSearch extends StatefulWidget {
  @override
  _JobSearchState createState() => _JobSearchState();
}

class _JobSearchState extends State<JobSearch> {
  var queryResultSet = [];
  var tempsearchstore = [];
  String search = "";
  String username = "hi";
  int f = 0;
  late QuerySnapshot snapshotData;
  late QuerySnapshot helloData;
  bool isexecuted = false;
  TextEditingController searchController = TextEditingController();

  initiateSearch() {
    queryResultSet = [];
    tempsearchstore = [];

    SearchService().searchByName().then((QuerySnapshot docse) {
      for (int i = 0; i < docse.docs.length; ++i) {
        queryResultSet.add(docse.docs[i].data());
        setState(() {
          print(queryResultSet[i]);
          tempsearchstore.add(queryResultSet[i]);
        });
      }
    });
  }

  getusername() {
    String refid = FirebaseAuth.instance.currentUser.uid;

    FirebaseFirestore.instance
        .collection('userdata')
        .doc(refid)
        .get()
        .then((value) {
      setState(() {
        username = value['username'];
      });
    });
  }

  @override
  void initState() {
    super.initState();

    initiateSearch();
    getusername();
  }

  nonsearchdata() {
    return ListView(
        padding: EdgeInsets.all(20),
        primary: true,
        shrinkWrap: true,
        children: tempsearchstore.map((element) {
          return buildResultCard(context, element);
        }).toList());
  }

  Widget reqsearchedData() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(20)),
            tileColor: Color(0xff383799),
            focusColor: Colors.green,
            leading: Icon(
              Icons.work,
              color: Colors.white,
            ),
            title: Text(helloData.docs[index].data()['jobtitle'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              helloData.docs[index].data()['companyname'],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobApply(
                      jobtitle: helloData.docs[index].data()['jobtitle'],
                      jobdisc: helloData.docs[index].data()['jobdisc'],
                      qualification:
                          helloData.docs[index].data()['qualification'],
                      websitelink: helloData.docs[index].data()['websitelink'],
                      isadmin: false,
                      companyname: helloData.docs[index].data()['companyname'],
                      refid: helloData.docs[index].data()['refid'],
                      email: helloData.docs[index].data()['emaillink'],
                      aboutcompany:
                          helloData.docs[index].data()['aboutcompany'],
                      isprev: false,
                      skills: helloData.docs[index].data()['skills']),
                ),
              );
            },
          ),
        );
      },
      itemCount: helloData.docs.length,
    );
  }

  Widget searchedData() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(20)),
            tileColor: Color(0xff383799),
            focusColor: Colors.green,
            leading: Icon(
              Icons.work,
              color: Colors.white,
            ),
            title: Text(snapshotData.docs[index].data()['jobtitle'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              snapshotData.docs[index].data()['companyname'],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobApply(
                    jobtitle: snapshotData.docs[index].data()['jobtitle'],
                    jobdisc: snapshotData.docs[index].data()['jobdisc'],
                    qualification:
                        snapshotData.docs[index].data()['qualification'],
                    websitelink: snapshotData.docs[index].data()['websitelink'],
                    isadmin: false,
                    companyname: snapshotData.docs[index].data()['companyname'],
                    refid: snapshotData.docs[index].data()['refid'],
                    email: snapshotData.docs[index].data()['emaillink'],
                    aboutcompany:
                        snapshotData.docs[index].data()['aboutcompany'],
                    isprev: false,
                    skills: snapshotData.docs[index].data()['skills'],
                  ),
                ),
              );
            },
          ),
        );
      },
      itemCount: snapshotData.docs.length,
    );
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
    return Scaffold(
        // fluter 1.x
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.account_box,
            color: Color(0xffCD225D),
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EditProfile()),
            );
          },
        ),
        appBar: AppBar(
          actions: [
            GetBuilder<DataController>(
                init: DataController(),
                builder: (val) {
                  return IconButton(
                      onPressed: () {
                        val
                            .queryDatar(searchController.text.toLowerCase())
                            .then((value) {
                          helloData = value;
                          isexecuted = true;
                        });
                        val
                            .queryData(searchController.text.toLowerCase())
                            .then((value) {
                          snapshotData = value;
                          setState(() {
                            isexecuted = true;
                          });
                        });
                      },
                      icon: Icon(Icons.search));
                }),
            IconButton(
                onPressed: () {
                  searchController.clear();
                  setState(() {
                    isexecuted = false;
                  });
                },
                icon: Icon(Icons.clear)),
          ],
          title: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Search Jobs',
                hintStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            controller: searchController,
          ),
          backgroundColor: Color(0xff383799),
        ),
        body: isexecuted
            ? Padding(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 0),
                child: Column(children: [searchedData(), reqsearchedData()]))
            : nonsearchdata(),

        /* SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                //obscureText: true,
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Job Search',
                  hintText: 'Enter the field of your interest',
                ),
                onChanged: (value) {
                  search = searchController.text;
                  initiateSearch(value);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      search = searchController.text;
                      initiateSearch(search);
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      search = "";
                      searchController.clear();
                      initiateSearch(search);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            ListView(
                padding: EdgeInsets.all(20),
                primary: true,
                shrinkWrap: true,
                children: tempsearchstore.map((element) {
                  return buildResultCard(context, element);
                }).toList()),

            /* SizedBox(
              height: 8.0,
            ),*/

            /*
            GestureDetector(
              child: ListTile(
                tileColor: Colors.lightBlueAccent,
                leading: Icon(Icons.add_circle),
                title: Text('FullStack Developer'),
                subtitle: Text('XYZ Technologies'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApply()),
                );
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            GestureDetector(
              child: ListTile(
                tileColor: Colors.lightBlueAccent,
                focusColor: Colors.green,
                leading: Icon(Icons.add_circle),
                title: Text('Content Writing Intern'),
                subtitle: Text('XYZ Technologies'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApply()),
                );
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            GestureDetector(
              child: ListTile(
                tileColor: Colors.lightBlueAccent,
                focusColor: Colors.green,
                leading: Icon(Icons.add_circle),
                title: Text('Data Analyst'),
                subtitle: Text('XYZ Technologies'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApply()),
                );
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            GestureDetector(
              child: ListTile(
                tileColor: Colors.lightBlueAccent,
                focusColor: Colors.green,
                leading: Icon(Icons.add_circle),
                title: Text('CA Intern'),
                subtitle: Text('XYZ Technologies'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApply()),
                );
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            GestureDetector(
              child: ListTile(
                tileColor: Colors.lightBlueAccent,
                focusColor: Colors.green,
                leading: Icon(Icons.add_circle),
                title: Text('Application Developer'),
                subtitle: Text('XYZ Technologies'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobApply()),
                );
              },
            ),
            SizedBox(
              height: 2.0,
            ),
            ListTile(
              tileColor: Colors.lightBlueAccent,
              focusColor: Colors.green,
              leading: Icon(Icons.add_circle),
              title: Text('Digital marketing Intern'),
              subtitle: Text('XYZ Technologies'),
            ),
            SizedBox(
              height: 2.0,
            ),
            ListTile(
              tileColor: Colors.lightBlueAccent,
              focusColor: Colors.green,
              leading: Icon(Icons.add_circle),
              title: Text('HR Intern'),
              subtitle: Text('XYZ Technologies'),
            ),
            SizedBox(
              height: 2.0,
            ),
            ListTile(
              tileColor: Colors.lightBlueAccent,
              focusColor: Colors.green,
              leading: Icon(Icons.add_circle),
              title: Text('Software Engineer'),
              subtitle: Text('XYZ Technologies'),
            ), */
          ],
        ),
      ), */
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                /*  IconButton(
                  tooltip: 'Edit Profile',
                  icon: Icon(
                    Icons.account_box,
                    color: Color(0xFF0D47A1),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EditProfile()),
                    );
                  },
                ), */
                IconButton(
                  tooltip: 'Log out',
                  icon: const Icon(
                    Icons.logout,
                    color: Color(0xffCD225D),
                    size: 30,
                  ),
                  onPressed: () {
                    _logOut();
                  },
                ),
                IconButton(
                  tooltip: 'Interested',
                  icon: const Icon(
                    Icons.analytics,
                    color: Color(0xffCD225D),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Appliedjobs()),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
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
                  data['companyname'],
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
                    builder: (context) => JobApply(
                      jobtitle: data['jobtitle'],
                      jobdisc: data['jobdisc'],
                      qualification: data['qualification'],
                      websitelink: data['websitelink'],
                      isadmin: false,
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
        ),
        SizedBox(
          height: 2.0,
        ),
      ],
    ),
  );
}
