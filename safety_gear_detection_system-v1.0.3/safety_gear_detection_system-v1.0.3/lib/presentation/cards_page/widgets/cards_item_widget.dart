import '../models/cards_item_model.dart';
import '../controller/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';

// ignore: must_be_immutable
class CardsItemWidget extends StatelessWidget {
  CardsItemWidget(
    this.cardsItemModelObj, {
    Key? key,
    this.onTapCard,
  }) : super(
          key: key,
        );

  CardsItemModel cardsItemModelObj;

  var controller = Get.find<CardsController>();

  VoidCallback? onTapCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCard!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 23.v,
        ),
        decoration: AppDecoration.gradientPrimaryToOnErrorContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 Text(
                cardsItemModelObj.time!.value.toDate().toString(),
                style: theme.textTheme.labelLarge,
              ),
            
            SizedBox(height: 30.v),
            Obx(
              () => Text(
                cardsItemModelObj.name!.value,
                style: CustomTextStyles.titleMediumOnPrimary,
              ),
            ),
            Center(
      child: Container(
        // Set both width and height to the same value for a square container
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        decoration: BoxDecoration(
          // You can customize the border, borderRadius, etc.
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(
          cardsItemModelObj.imageUrl!.value,
          fit: BoxFit.cover,  // This ensures the image covers the container fully
        ),
      ),
    ),
            SizedBox(height: 30.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
 Text(
                          'Alert Type',
                          style: theme.textTheme.labelSmall,
                        ),
                      
                      SizedBox(height: 3.v),
                      Obx(
                        () => Text(
                          cardsItemModelObj.alertType!.value,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.notifications,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(top: 12.v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
