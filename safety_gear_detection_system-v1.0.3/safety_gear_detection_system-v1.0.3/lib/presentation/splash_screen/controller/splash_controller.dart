import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_gear_detection_system/methods.dart';

import '../../../core/app_export.dart';
import '../models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
    final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Future<void> onReady() async {
    if (_auth.currentUser == null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(
        AppRoutes.onboardingScreen,
      );
    });
    } else {
      await getrtsp();
     Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(
        AppRoutes.homeContainerScreen,
      );
    });
    }
    
  }
}
