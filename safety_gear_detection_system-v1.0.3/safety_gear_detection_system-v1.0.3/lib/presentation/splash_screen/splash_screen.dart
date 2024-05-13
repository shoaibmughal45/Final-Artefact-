import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 108.v,
                    width: 106.h,
                    alignment: Alignment.center))));
  }
}
