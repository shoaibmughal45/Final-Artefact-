import 'package:safety_gear_detection_system/widgets/app_bar/custom_app_bar.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_title.dart';
import 'package:safety_gear_detection_system/widgets/custom_drop_down.dart';
import 'widgets/history_item_widget.dart';
import 'models/history_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/history_controller.dart';

// ignore_for_file: must_be_immutable
class HistoryScreen extends GetWidget<HistoryController> {
  const HistoryScreen({Key? key})
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
            vertical: 34.v,
          ),
          child: Column(
            children: [
              _buildFrame(),
              SizedBox(height: 23.v),
              _buildHistory(),
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
        text: "lbl_histroy".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomDropDown(
          width: 170.h,
          icon: Container(
            margin: EdgeInsets.only(left: 9.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgFavoriteOnprimarycontainer12x12,
              height: 12.adaptSize,
              width: 12.adaptSize,
            ),
          ),
          hintText: "lbl_electric_bill".tr,
          hintStyle: theme.textTheme.headlineMedium!,
          items: controller.historyModelObj.value.dropdownItemList!.value,
          onChanged: (value) {
            controller.onSelected(value);
          },
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 11.v,
            bottom: 8.v,
          ),
          child: Text(
            "lbl_all_time".tr,
            style: CustomTextStyles.labelLargeGray500,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgFavoriteGray500,
          height: 12.adaptSize,
          width: 12.adaptSize,
          margin: EdgeInsets.only(
            left: 3.h,
            top: 14.v,
            bottom: 9.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHistory() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 9.0.v),
            child: SizedBox(
              width: 366.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.blueGray100,
              ),
            ),
          );
        },
        itemCount:
            controller.historyModelObj.value.historyItemList.value.length,
        itemBuilder: (context, index) {
          HistoryItemModel model =
              controller.historyModelObj.value.historyItemList.value[index];
          return HistoryItemWidget(
            model,
          );
        },
      ),
    );
  }
}
