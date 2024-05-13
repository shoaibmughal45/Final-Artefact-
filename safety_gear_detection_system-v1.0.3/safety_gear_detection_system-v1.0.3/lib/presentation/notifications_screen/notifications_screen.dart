import 'package:safety_gear_detection_system/widgets/app_bar/custom_app_bar.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_title.dart';
import 'package:safety_gear_detection_system/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/notifications_controller.dart';

// ignore_for_file: must_be_immutable
class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 35.v,
          ),
          child: Column(
            children: [
              _buildOne(),
              SizedBox(height: 25.v),
              _buildTwo(),
              SizedBox(height: 28.v),
              _buildThree(),
              SizedBox(height: 25.v),
              _buildFour(),
              SizedBox(height: 27.v),
              _buildFive(),
              SizedBox(height: 27.v),
              _buildSix(),
              SizedBox(height: 25.v),
              _buildSeven(),
              SizedBox(height: 25.v),
              _buildEight(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 68.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgFavoriteOnprimary,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 6.v,
          bottom: 6.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_notifications".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_receive".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_anyone_sent_you".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.symmetric(vertical: 11.v),
            value: controller.isSelectedSwitch.value,
            onChange: (value) {
              controller.isSelectedSwitch.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_card_activation".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "lbl_if_card_active".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.only(
              top: 13.v,
              bottom: 10.v,
            ),
            value: controller.isSelectedSwitch1.value,
            onChange: (value) {
              controller.isSelectedSwitch1.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_update_feature".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_any_new_update".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.symmetric(vertical: 11.v),
            value: controller.isSelectedSwitch2.value,
            onChange: (value) {
              controller.isSelectedSwitch2.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFour() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_cash_in".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_if_any_cash_in_your".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.only(
              top: 13.v,
              bottom: 11.v,
            ),
            value: controller.isSelectedSwitch3.value,
            onChange: (value) {
              controller.isSelectedSwitch3.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFive() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_request".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 8.v),
            Text(
              "msg_if_anyone_sent_you2".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.symmetric(vertical: 11.v),
            value: controller.isSelectedSwitch4.value,
            onChange: (value) {
              controller.isSelectedSwitch4.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSix() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_money_trasfer".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 7.v),
            Text(
              "msg_if_you_sent_money".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.symmetric(vertical: 11.v),
            value: controller.isSelectedSwitch5.value,
            onChange: (value) {
              controller.isSelectedSwitch5.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSeven() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "msg_number_notification".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_send_notification".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.only(
              top: 13.v,
              bottom: 11.v,
            ),
            value: controller.isSelectedSwitch6.value,
            onChange: (value) {
              controller.isSelectedSwitch6.value = value;
            },
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "msg_email_notification".tr,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: 9.v),
            Text(
              "msg_send_notification2".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Obx(
          () => CustomSwitch(
            margin: EdgeInsets.only(
              top: 13.v,
              bottom: 11.v,
            ),
            value: controller.isSelectedSwitch7.value,
            onChange: (value) {
              controller.isSelectedSwitch7.value = value;
            },
          ),
        ),
      ],
    );
  }
}
