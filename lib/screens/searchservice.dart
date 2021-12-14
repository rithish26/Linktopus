import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName() {
    return FirebaseFirestore.instance.collection('JOBS').get();
  }

  searchbyuser() {
    return FirebaseFirestore.instance
        .collection('JOBS')
        .doc()
        .collection('applicants')
        .get();
  }
}
