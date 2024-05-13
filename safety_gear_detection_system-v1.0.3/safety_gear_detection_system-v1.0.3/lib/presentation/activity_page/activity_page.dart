import 'package:safety_gear_detection_system/widgets/custom_icon_button.dart';
import 'package:safety_gear_detection_system/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/activity_controller.dart';
import 'models/activity_model.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({Key? key})
      : super(
          key: key,
        );

  ActivityController controller =
      Get.put(ActivityController(ActivityModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.bg,
          child: Column(
            children: [
              SizedBox(height: 40.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomIconButton(
                              height: 44.adaptSize,
                              width: 44.adaptSize,
                              padding: EdgeInsets.all(10.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGrid,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 102.h,
                                top: 8.v,
                                bottom: 9.v,
                              ),
                              child: Text(
                                "lbl_activity".tr,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.v),
                        _buildIncomeSection(),
                        SizedBox(height: 40.v),
                        _buildTransactionSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIncomeSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: AppDecoration.white,
      child: Column(
        children: [
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(
              left: 48.h,
              right: 38.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    "Hats".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Text(
                  "Vests".tr,
                  style: CustomTextStyles.titleLargeGray500,
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCalendar,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 7.v,
                    bottom: 10.v,
                  ),
                  child: Text(
                    "lbl_16_23_jan".tr,
                    style: CustomTextStyles.bodyLargeOnPrimaryContainer17,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgUserOnprimarycontainer,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 8.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          SizedBox(
            height: 208.v,
            width: 335.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLine,
                  height: 208.v,
                  width: 264.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 14.v),
                    padding: EdgeInsets.symmetric(
                      horizontal: 103.h,
                      vertical: 23.v,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: fs.Svg(
                          ImageConstant.imgGroup3,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 32.v),
                        CustomElevatedButton(
                          height: 40.v,
                          width: 90.h,
                          text: "15 Hats ".tr,
                          leftIcon: Container(
                            padding: EdgeInsets.all(3.h),
                            margin: EdgeInsets.only(right: 4.h),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(
                                6.h,
                              ),
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.notificationsBlack,
                              height: 10.adaptSize,
                              width: 10.adaptSize,
                            ),
                          ),
                          buttonStyle: CustomButtonStyles.outlineBlueGray,
                          buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Analysis".tr,
                style: CustomTextStyles.headlineSmallExtraBold,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.v,
                  bottom: 6.v,
                ),
                child: Text(
                  "lbl_25_jan".tr,
                  style: CustomTextStyles.labelLargeGray500,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFavoriteGray500,
                height: 12.adaptSize,
                width: 12.adaptSize,
                margin: EdgeInsets.only(
                  left: 3.h,
                  top: 12.v,
                  bottom: 6.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 29.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 6.v,
                  bottom: 5.v,
                ),
                child: CustomIconButton(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  padding: EdgeInsets.all(10.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgUserOnprimary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  top: 13.v,
                  bottom: 16.v,
                ),
                child: Text(
                  "lbl_limit".tr,
                  style: CustomTextStyles.titleMediumSemiBold,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "12 Voilations Per Day".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "lbl_per_day".tr,
                      style: CustomTextStyles.bodyLarge16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.h),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 47.v),
                          Container(
                            height: 75.v,
                            width: 10.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(
                                5.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "lbl_17".tr,
                      style: CustomTextStyles.labelLargeGray700,
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      "lbl_mon".tr,
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.h),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 83.v),
                            Container(
                              height: 39.v,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Text(
                        "lbl_18".tr,
                        style: CustomTextStyles.labelLargeGray700,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_tue".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.h),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 70.v),
                            Container(
                              height: 52.v,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Text(
                        "lbl_19".tr,
                        style: CustomTextStyles.labelLargeGray700,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_wed".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.h),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 23.v),
                            Container(
                              height: 99.v,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "lbl_20".tr,
                          style: CustomTextStyles.labelLargeGray700,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_thu".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(left: 1.h),
                          decoration: AppDecoration.fillGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 57.v),
                              Container(
                                height: 65.v,
                                width: 10.h,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                    5.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Text(
                        "lbl_21".tr,
                        style: CustomTextStyles.labelLargeGray700,
                      ),
                      SizedBox(height: 2.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "lbl_fri".tr,
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.h),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 89.v),
                          Container(
                            height: 33.v,
                            width: 10.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(
                                5.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "lbl_22".tr,
                      style: CustomTextStyles.labelLargeGray700,
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      "lbl_sat".tr,
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 27.h),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.h),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 57.v),
                            Container(
                              height: 65.v,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  5.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Text(
                        "lbl_23".tr,
                        style: CustomTextStyles.labelLargeGray700,
                      ),
                      SizedBox(height: 2.v),
                      Text(
                        "lbl_sun".tr,
                        style: theme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
