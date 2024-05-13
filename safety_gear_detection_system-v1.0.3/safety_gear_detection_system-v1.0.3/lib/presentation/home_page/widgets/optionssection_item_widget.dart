import '../models/optionssection_item_model.dart';
import '../controller/home_controller.dart';
import 'package:safety_gear_detection_system/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';

// ignore: must_be_immutable
class OptionssectionItemWidget extends StatelessWidget {
  OptionssectionItemWidget(
    this.optionssectionItemModelObj, {
    Key? key,
    this.onTapOne,
  }) : super(
          key: key,
        );

  OptionssectionItemModel optionssectionItemModelObj;

  var controller = Get.find<HomeController>();

  VoidCallback? onTapOne;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOne!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 24.v,
        ),
        decoration: AppDecoration.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.fillRed,
                child: CustomImageView(
                  imagePath: optionssectionItemModelObj.favorite!.value,
                ),
              ),
            ),
            SizedBox(height: 20.v),
            SizedBox(
              width: 62.h,
              child: Obx(
                () => Text(
                  optionssectionItemModelObj.sendMoney!.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 9.v),
            Obx(
              () => Text(
                optionssectionItemModelObj.card!.value,
                style: CustomTextStyles.bodyLarge16,
              ),
            ),
            SizedBox(height: 3.v),
          ],
        ),
      ),
    );
  }
}
