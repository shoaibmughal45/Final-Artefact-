import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String rtspReal = '';
  String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Constructor
  UserModel();

  // Method to fetch token and update Firestore
  Future<void> getToken() async {
    token = await firebaseMessaging.getToken() ?? '';  // Handle null case
    String uid = auth.currentUser?.uid ?? ''; // Ensure there is a user logged in
    
    if (uid.isNotEmpty && token.isNotEmpty) {
      await FirebaseFirestore.instance.collection('Users').doc(uid).update({
        'deviceToken': token
      });
    } else {
      print('Error: No user logged in or failed to get token.');
    }
  }

  // Method to fetch RTSP from Firestore and print it
  Future<String> getRTSP() async {
    String uid = auth.currentUser?.uid ?? ''; // Ensure there is a user logged in
    if (uid.isEmpty) {
      print('Error: No user logged in.');
      return '';
    }
    
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    rtspReal = (snapshot.data() as Map<String, dynamic>)['RTSP'] ?? '';
    
    print("RTSP value is $rtspReal");
    return rtspReal;
  }
}
