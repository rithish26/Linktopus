import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getdata(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('JOBS')
        .where('jobtitlekey', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  Future queryDatar(String queryString) async {
    return FirebaseFirestore.instance
        .collection('JOBS')
        .where('skillskey', isEqualTo: queryString)
        .get();
  }

  Future queryDatareq(String queryString) async {
    return FirebaseFirestore.instance
        .collection('JOBS')
        .where('jobtitle', isGreaterThanOrEqualTo: queryString)
        .where('qualification', isGreaterThanOrEqualTo: queryString)
        .get();
  }
}
