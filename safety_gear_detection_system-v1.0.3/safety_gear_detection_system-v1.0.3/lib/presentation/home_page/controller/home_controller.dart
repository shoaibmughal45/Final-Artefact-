import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:safety_gear_detection_system/main.dart';

import '../../../core/app_export.dart';
import '../models/home_model.dart';

/// A controller class for the HomePage.
///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  HomeController(this.homeModelObj);
    VlcPlayerController videoPlayerController = VlcPlayerController.network(
      userModel.rtspReal!=''?userModel.rtspReal:'https://media.w3.org/2010/05/sintel/trailer.mp4',
      hwAcc: HwAcc.auto,
      autoPlay: true,
      autoInitialize: true,
      onInit: () {

      },
    );

  Rx<HomeModel> homeModelObj;
  @override
  void onInit() {
   
    super.onInit();

    // Example: Initialize variables, fetch initial data, etc.
  }
 void stopVideoController() async{

     
   await videoPlayerController.stopRendererScanning();
   await videoPlayerController.dispose();

 }
   @override
  void dispose() {
    stopVideoController();
    super.dispose();
  }
}
