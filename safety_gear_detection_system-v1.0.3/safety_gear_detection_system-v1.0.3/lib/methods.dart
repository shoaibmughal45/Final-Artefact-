import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:safety_gear_detection_system/skelton.dart';
String rtspReal='';
 String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

 Future getToken() async {
    
    token = (await firebaseMessaging.getToken())!;
     FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({
          'deviceToken': token
        });


    
  }
void showSnackBar(BuildContext context, String str) {
  final Scaffold = ScaffoldMessenger.of(context);
  Scaffold.showSnackBar(SnackBar(
    content: Text(str),
    action: SnackBarAction(
      label: "LOGIN",
      onPressed: () {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
      },
    ),
  ));
}


void showSimpleBar(BuildContext context, String str) {
  final Scaffold = ScaffoldMessenger.of(context);
  Scaffold.showSnackBar(SnackBar(
    content: Text(str),
    ));
}




Future<UserCredential?> createAccount(BuildContext context,String email, String password,String RSTP,String name) async {

sucess() async {


      Get.back();

     alertbox(context,'Verification Email Sent',
                    "Email Verification Sent, Please verify the Email First",'assets/images/mail-verification.gif');

}

failure(String e){


   Get.back();

     alertbox(context, 'Signup Failed', e, 'assets/images/alerts.gif');
     return null;
}





  try {
    
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    userCredential.user?.sendEmailVerification();

    final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  
    Map<String, dynamic> g = {
      "Email": email,
      "Password": password,
      "RTSP":RSTP,
      "Name":name,
      "isDetectionEnabled":false,
      "deviceToken":""
      };
    users.doc(_auth.currentUser!.uid).set(g);
  
    sucess();


  } on FirebaseAuthException catch (e) {
    print('aag'+e.toString());
    
    failure(e.toString());
    return null;
  }
}

Future<UserCredential?> signin(String email, String password) async {
  try {

    print(email+'  '+password);
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return userCredential;
  } catch (e) {
    print(e);
    return null;
  }
}

reset(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  await _auth.sendPasswordResetEmail(email: email);
}

logout(BuildContext context) async {






sucess() async {


      
    
   Navigator.pop(context,true);
  await _auth.signOut();
    Get.toNamed(
      AppRoutes.logInScreen,
    );

}

failure(){


   Get.back();

     alertbox(context, 'Connection Failed', 'Please Check your Internet Connection', 'assets/images/alerts.gif');
     return null;
}






   await FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).update({
          'deviceToken': ''
        }).then((value) => sucess()).timeout(const Duration(seconds: 10)).catchError((error, stackTrace) => failure());;

}

class EnterData {
  final String drinkName;
  final String drinkDesc;
  EnterData(this.drinkName, this.drinkDesc);

  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection(_auth.currentUser!.uid);

  addData() {
    Map<String, String> g = {
      "Drink Name": drinkName,
      "Drink Desc": drinkDesc,
    };

    cartCollection.doc().set(g);
  }
}

class GetData {
  final CollectionReference captures =
      FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Captures');


   getData() async {
 List captureList = [];

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await captures.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    captureList = allData;

    
    return captureList;


  }





alertbox(){







  
}



}





alertbox(context,text,subtext,path){

   showDialog(
   context: context,
   builder: (BuildContext context) {
     return GiffyDialog.image(
       Image.asset(
         path,
         height: 200,
         fit: BoxFit.cover,
       ),
       title: Text(
        text,
         textAlign: TextAlign.center,
       ),
       content: Text(
       subtext,
         textAlign: TextAlign.center,
       ),
       actions: [
         TextButton(
           onPressed: () => Navigator.pop(context, 'CANCEL'),
           child: const Text('CANCEL'),
         ),
         TextButton(
           onPressed: () => Navigator.pop(context, 'OK'),
           child: const Text('OK'),
         ),
       ],
     );
   },
 );
}






shrink(){



  Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: 10),
              const Skeleton(),
              const SizedBox(height: 10),
              const Skeleton(),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
}



Future getrtsp()  async {
 
   await
      FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).get()
    .then((value) {
      

      
             userModel.rtspReal= value.data()!['RTSP'];
            
      
       print("value is "+rtspReal);
       return value.data()!['RTSP'];



       // Access your after your get the data
     });
  }
