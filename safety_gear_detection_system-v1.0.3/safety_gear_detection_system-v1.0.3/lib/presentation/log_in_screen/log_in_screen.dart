import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_gear_detection_system/core/utils/validation_functions.dart';
import 'package:safety_gear_detection_system/methods.dart';
import 'package:safety_gear_detection_system/presentation/home_container_screen/home_container_screen.dart';
import 'package:safety_gear_detection_system/widgets/custom_text_form_field.dart';
import 'package:safety_gear_detection_system/widgets/custom_elevated_button.dart';
import 'package:safety_gear_detection_system/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/log_in_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends GetWidget<LogInController> {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.h, vertical: 40.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgThumbsUp,
                                  height: 80.v,
                                  width: 78.h),
                              SizedBox(height: 24.v),
                              Text("lbl_hello".tr,
                                  style: theme.textTheme.displayMedium),
                              SizedBox(height: 10.v),
                              Text("msg_enter_your_detail".tr,
                                  style: CustomTextStyles.bodyLarge16),
                              SizedBox(height: 73.v),
                              _buildInputFieldPhoneOrEmail(),
                              SizedBox(height: 23.v),
                              _buildInputFieldPassword(),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                  text: "lbl_sign_in".tr.toUpperCase(),
                                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                                  onPressed: () {
                                    onTapSIGNIN(context);
                                  }),
                              SizedBox(height: 40.v),
                              CustomOutlinedButton(
                                  text: "msg_sign_in_with_google"
                                      .tr
                                      .toUpperCase(),
                                  margin: EdgeInsets.only(left: 6.h),
                                  leftIcon: Container(
                                      margin: EdgeInsets.only(right: 10.h),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgGoogle,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  onPressed: () {

                                  }),
                              SizedBox(height: 77.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.v),
                                        child: Text("lbl_have_account".tr,
                                            style: CustomTextStyles
                                                .titleLargeGray500Regular)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignUp();
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.h, top: 2.v),
                                            child: Text("lbl_sign_up".tr,
                                                style: CustomTextStyles
                                                    .titleLargePrimary)))
                                  ]),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildInputFieldPhoneOrEmail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_phone_or_email".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.phoneController,
              hintText: "lbl_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCheckmark,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 64.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v))
        ]));
  }

  /// Section Widget
  Widget _buildInputFieldPassword() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_password".tr, style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.passwordController,
              hintText: "lbl_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLocation,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 64.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true,
              contentPadding:
                  EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v))
        ]));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapSIGNIN(context) async {

                 showDialog(context: context, builder: (context){

                                        return Center(child: CircularProgressIndicator());

                                     });


                            // Add login code
                            
                            
                                UserCredential? userCredential =
                        await signin(controller.phoneController.text, controller.passwordController.text);
                    if (userCredential?.user != null) {
                      userCredential!.user!.emailVerified
                          ? {Get.back(),
                                alertbox(context,'Signin Completed','You are being Signed in!','assets/images/successful.gif'),
                                await getrtsp(),
                                await getToken(),
                          
                         Get.offAll(() => HomeContainerScreen())
                              }
                          :() {Get.back(); 
                          alertbox(context,'Please Verify Email ',
                        "Email Verification was sent to your Email, Please verify the Email First",'assets/images/alerts.gif');};
                    } else {
                      Get.back();
                      alertbox(context,'Signin Eror','Incorrect Email or Password. Kindly Type Correct Credentials!','assets/images/cancel.gif');
                      print('error');
                    }
                       

  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}


