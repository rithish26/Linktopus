import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'jobsearch.dart';

class ProfileScreen extends StatefulWidget {
  String refid = "";
  ProfileScreen({required this.refid});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String refid = "";

  TextEditingController _name = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _mobilenumber = TextEditingController();
  TextEditingController _jobexperience = TextEditingController();
  TextEditingController _skills = TextEditingController();
  TextEditingController _currentrole = TextEditingController();
  TextEditingController _username = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refid = widget.refid;
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

  /*  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _lastname.dispose();
    _currentrole.dispose();
    _jobexperience.dispose();
    _skills.dispose();
    _currentrole.dispose();
    _username.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff383799),
        title: Text('User Profile'),
      ),
      backgroundColor: Color(0xff383799),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 00.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /* Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.blue[200],
                    backgroundImage: AssetImage('assets/images/542239-200.png'),
                  ),
                ), */
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: (Text("Applicant details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ))),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.account_box),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Firstname',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _lastname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_outlined),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Lastname',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_sharp),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _mobilenumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.add_call),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _jobexperience,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.add_chart_outlined),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Job experience',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _skills,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.computer),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Skills',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  readOnly: true,
                  controller: _currentrole,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    fillColor: Color(0xff383799),
                    filled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {},
                        icon: Icon(Icons.contacts),
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Role',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
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
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
