import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import '../../../core/app_export.dart';
import '../models/home_container_model.dart';
import 'package:safety_gear_detection_system/methods.dart';
/// A controller class for the HomeContainerScreen.
///
/// This class manages the state of the HomeContainerScreen, including the
/// current homeContainerModelObj
class HomeContainerController extends GetxController {
   void onInit() {
   
    userModel.getToken();
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  RemoteNotification? notification = message.notification;
   print("onMessageData: $message");
  FlutterRingtonePlayer().playNotification();
  alertbox(Get.context, message.notification!.body,message.notification!.title,'assets/images/alerts.gif');;});
//notifications for opened app
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  FlutterRingtonePlayer().playNotification();
  alertbox(Get.context, message.notification!.body,message.notification!.title,'assets/images/alerts.gif');
  print("onMessageOpenedApp: $message");});

FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        FlutterRingtonePlayer().playNotification();
        alertbox(Get.context, message.notification!.body,message.notification!.title,'assets/images/alerts.gif');      }
    });

    super.onInit();
  }

  @override
  void onClose() {
   
    super.onClose();
  }

  Rx<HomeContainerModel> homeContainerModelObj = HomeContainerModel().obs;
}
