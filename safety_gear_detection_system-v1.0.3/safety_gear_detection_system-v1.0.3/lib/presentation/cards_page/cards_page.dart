import 'package:safety_gear_detection_system/widgets/app_bar/custom_app_bar.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_title.dart';
import 'package:safety_gear_detection_system/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'widgets/cards_item_widget.dart';
import 'models/cards_item_model.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/core/app_export.dart';
import 'controller/cards_controller.dart';
import 'models/cards_model.dart';

// ignore_for_file: must_be_immutable
class CardsPage extends StatelessWidget {
  CardsPage({Key? key}) : super(key: key);

  CardsController controller = Get.put(CardsController(CardsModel().obs));

  @override
  Widget build(BuildContext context) {
      
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: AppDecoration.bg,
                  child: Column(children: [
                    SizedBox(height: 34.v),
                    _buildCards(),
                    
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgGrid,
            margin: EdgeInsets.only(left: 24.h, top: 6.v, bottom: 6.v)),
        centerTitle: true,
        title: AppbarTitle(text: "Alerts"),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgPlus,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 6.v),
              onTap: () {
          
              })
        ]);
  }



/// Section Widget
Widget _buildCards() {
  return Flexible(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: StreamBuilder<List<CardsItemModel>>(
        stream: controller.streamCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.separated(primary: true,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 36.v),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CardsItemModel model = snapshot.data![index];
                return CardsItemWidget(model, onTapCard: () {
                  // Handle tap
                });
              });
          } else {
            return Text("No data available");
          }
        }
      ),
    ),
  );
}
}
