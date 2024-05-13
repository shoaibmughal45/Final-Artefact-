import '../models/history_item_model.dart';
import '../controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';

// ignore: must_be_immutable
class HistoryItemWidget extends StatelessWidget {
  HistoryItemWidget(
    this.historyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HistoryItemModel historyItemModelObj;

  var controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                historyItemModelObj.month!.value,
                style: theme.textTheme.titleSmall,
              ),
            ),
            Obx(
              () => Text(
                historyItemModelObj.date!.value,
                style: CustomTextStyles.bodySmallGray500,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                historyItemModelObj.amount!.value,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Obx(
                () => Text(
                  historyItemModelObj.price!.value,
                  style: CustomTextStyles.titleSmallBold,
                ),
              ),
            ),
            Spacer(),
            Obx(
              () => Text(
                historyItemModelObj.unpaid!.value,
                style: CustomTextStyles.labelLargeGreen600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
