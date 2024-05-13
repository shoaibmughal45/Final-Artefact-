import '../../../core/app_export.dart';
import '../models/sign_up_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController rtspController = TextEditingController();
  
  TextEditingController nameController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }
}
