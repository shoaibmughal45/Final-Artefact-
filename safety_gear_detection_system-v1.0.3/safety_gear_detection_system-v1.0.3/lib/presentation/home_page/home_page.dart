import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:safety_gear_detection_system/methods.dart';
import 'package:safety_gear_detection_system/widgets/custom_icon_button.dart';
import 'widgets/optionssection_item_widget.dart';
import 'models/optionssection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.bg,
                child: Column(children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomIconButton(
                                              height: 44.adaptSize,
                                              width: 44.adaptSize,
                                              padding: EdgeInsets.all(10.h),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgGrid)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.h,
                                                  top: 6.v,
                                                  bottom: 11.v),
                                              child: Text("HOME",
                                                  style: theme
                                                      .textTheme.titleLarge)),
                                                        CustomIconButton(
                                              height: 44.adaptSize,
                                              width: 44.adaptSize,
                                              padding: EdgeInsets.all(10.h),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgArrowRight,
                                                      onTap: (){logout(context);})),


                                        ]),
                                    SizedBox(height: 40.v),
                                    _buildTotalBalanceSection(),
                                    SizedBox(height: 40.v),
                                    _buildOptionsSection()
                                  ]))))
                ]))));
  }

  /// Section Widget
  Widget _buildTotalBalanceSection() {
    return Container(
        padding: EdgeInsets.symmetric( vertical: 18.v),
        decoration: AppDecoration.fillPrimary,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("CCTV Footage",
              style: CustomTextStyles.bodyLargeOnPrimary),
          SizedBox(height: 4.v),
          Container(height: 250.v,
          width: 800.h,
            child: StreamBuilder<DocumentSnapshot>(
  stream: FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots(),
  builder:
      (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
      return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    if (!snapshot.hasData) {
      return Text("No data");
    }
      
    VlcPlayerController videoPlayerController= VlcPlayerController.network(
       snapshot.data?['RTSP'],
      hwAcc: HwAcc.auto,
      autoPlay: true,
      autoInitialize: true,
      onInit: () {

      },
    );
    return VlcPlayer(
      
      controller: videoPlayerController,
      aspectRatio: 16 / 9,
      placeholder: Center(child: CircularProgressIndicator()),
    );
  },
),
          ),
        ]));
  }

  /// Section Widget
  Widget _buildOptionsSection() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 199.v,
            crossAxisCount: 2,
            mainAxisSpacing: 24.h,
            crossAxisSpacing: 24.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount:
            controller.homeModelObj.value.optionssectionItemList.value.length,
        itemBuilder: (context, index) {
          OptionssectionItemModel model =
              controller.homeModelObj.value.optionssectionItemList.value[index];
          return OptionssectionItemWidget(model, onTapOne: () {
            
          });
        }));
  }


}
