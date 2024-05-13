import 'package:safety_gear_detection_system/widgets/app_bar/custom_app_bar.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_title.dart';
import 'package:safety_gear_detection_system/widgets/custom_icon_button.dart';
import 'package:safety_gear_detection_system/widgets/custom_text_form_field.dart';
import 'package:safety_gear_detection_system/core/utils/validation_functions.dart';
import 'package:safety_gear_detection_system/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/edit_profile_controller.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
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
                                horizontal: 24.h, vertical: 18.v),
                            child: Column(children: [
                              GestureDetector(
                                  onTap: () {
                                    onTapProfile();
                                  },
                                  child: SizedBox(
                                      height: 139.adaptSize,
                                      width: 139.adaptSize,
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse107,
                                                height: 139.adaptSize,
                                                width: 139.adaptSize,
                                                radius:
                                                    BorderRadius.circular(69.h),
                                                alignment: Alignment.center),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 7.h),
                                                child: CustomIconButton(
                                                    height: 30.adaptSize,
                                                    width: 30.adaptSize,
                                                    padding:
                                                        EdgeInsets.all(9.h),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .outlineGray,
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgThumbsUpOnprimary)))
                                          ]))),
                              SizedBox(height: 8.v),
                              Text("lbl_suzane_jobs".tr,
                                  style: theme.textTheme.displaySmall),
                              SizedBox(height: 9.v),
                              Text("lbl_user_gmail_com".tr,
                                  style: CustomTextStyles.titleSmallGray500),
                              SizedBox(height: 41.v),
                              _buildInputField1(),
                              SizedBox(height: 23.v),
                              _buildInputField2(),
                              SizedBox(height: 23.v),
                              _buildInputField3(),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                  text: "lbl_save".tr.toUpperCase()),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgFavoriteOnprimary,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_edit_profile".tr));
  }

  /// Section Widget
  Widget _buildInputField1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_name".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: controller.nameController, hintText: "lbl_suzane_jobs".tr)
    ]);
  }

  /// Section Widget
  Widget _buildInputField2() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_email".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: controller.emailController,
          hintText: "lbl_abc_gmail_com".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputField3() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_phone".tr, style: CustomTextStyles.bodyLargeGray70001),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: controller.phoneController,
          hintText: "lbl_91_123456890".tr,
          textInputAction: TextInputAction.done)
    ]);
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapProfile() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
