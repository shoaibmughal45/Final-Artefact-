import 'package:safety_gear_detection_system/core/utils/validation_functions.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:safety_gear_detection_system/methods.dart';
import 'package:safety_gear_detection_system/widgets/custom_text_form_field.dart';
import 'package:safety_gear_detection_system/widgets/custom_elevated_button.dart';
import 'package:safety_gear_detection_system/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/sign_up_controller.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

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
                                   SizedBox(height: 69.v),
                              _buildInputFieldName(),
                              SizedBox(height: 23.v),
                              _buildInputFieldPhoneOrEmail(),
                              SizedBox(height: 23.v),
                              _buildInputFieldSetPassword(),
                              SizedBox(height: 23.v),
                              _buildInputFieldConfirmPassword(),
                              SizedBox(height: 23.v),
                              _buildInputFieldRTSP(),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                  text: "lbl_sign_up2".tr.toUpperCase(),
                                  margin: EdgeInsets.only(left: 6.h),
                                  onPressed: () {
                                    onTapSIGNUp(context);
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
                                          onTapTxtSignIn();
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.h, top: 2.v),
                                            child: Text("lbl_sign_in2".tr,
                                                style: CustomTextStyles
                                                    .titleLargePrimary)))
                                  ]),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildInputFieldPhoneOrEmail() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
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
  Widget _buildInputFieldSetPassword() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_set_password".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.passwordController,
              hintText: "lbl_set_password".tr,
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


Widget _buildInputFieldName() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Name",
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.nameController,
              hintText: "Name",
              textInputType: TextInputType.name,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNavProfile,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 64.v),
              validator: (value) {
                if (value == ''
                   ) {
                  return "Valid Name".tr;
                }
                return null;
              },
              obscureText: false,
              contentPadding:
                  EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v))
        ]));
  }



  /// Section Widget
  Widget _buildInputFieldConfirmPassword() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_confirm_password".tr,
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.confirmpasswordController,
              hintText: "msg_confirm_password".tr,
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

  /// Navigates to the logInScreen when the action is triggered.
  onTapSIGNUp(context) {
    if (_formKey.currentState!.validate()) {
                                
                       showDialog(context: context, builder: (context){

                                        return Center(child: CircularProgressIndicator());

                                     });

                      print(controller.phoneController.text+"   "+controller.passwordController.text);

                        createAccount(context,controller.phoneController.text, controller.passwordController.text,controller.rtspController.text,controller.nameController.text,);
               
                        
                       
                      // Add login code
                    }

  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapTxtSignIn() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }



  Widget _buildInputFieldRTSP() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("RTSP",
              style: CustomTextStyles.bodyLargeGray70001),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: controller.rtspController,
              hintText: "RTSP",
              textInputType: TextInputType.url,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 20.v, 12.h, 20.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgNavProfile,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 64.v),
              validator: (value) {
                if (value == ''
                   ) {
                  return "Valid Name".tr;
                }
                return null;
              },
              obscureText: false,
              contentPadding:
                  EdgeInsets.only(top: 20.v, right: 30.h, bottom: 20.v))
        ]));
  }
}



