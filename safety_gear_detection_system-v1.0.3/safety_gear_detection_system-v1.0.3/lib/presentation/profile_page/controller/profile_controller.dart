import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:safety_gear_detection_system/methods.dart';

import '../../../core/app_export.dart';
import '../models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:safety_gear_detection_system/data/models/me/get_me_resp.dart';
import 'package:safety_gear_detection_system/data/apiClient/api_client.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  Rx<ProfileModel> profileModelObj;

  Rx<bool> isSelectedSwitch = false.obs;

  GetMeResp getMeResp = GetMeResp();
    TextEditingController changeRtspController = TextEditingController();


  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateFirestore(String text, BuildContext context) async {
    await firestore.collection('Users').doc(userModel.auth.currentUser!.uid).update({
      'RTSP': text,
    });
    Get.back();
    alertbox(context, 'RTSP Updated', 'RTSP has been updated successfully','assets/images/successful.gif');
     // Close the dialog after updating
  }





  ///
  /// The [Map] parameter represents request body
  Future<void> callFetchMe() async {
    try {
      getMeResp = await Get.find<ApiClient>().fetchMe(headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNmZiNzBhZWJiM2RiYjVlYmVkYTBmMiIsInVzZXJuYW1lIjoiT3Jpb24xNyIsImlhdCI6MTY3ODc3NjY2OX0.16TzzeJMkGbsT-hk-wigjBt4xeJNcwNzVvnl05evYUk',
      });
      _handleFetchMeSuccess();
    } on GetMeResp catch (e) {
      getMeResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleFetchMeSuccess() {
    profileModelObj.value.email.value = getMeResp.data!.email!.toString();
    profileModelObj.value.suzaneJobs.value = getMeResp.data!.name!.toString();
  }

  /// calls the [https://nodedemo.dhiwise.co/device/api/v1/user/me] API
  ///
  /// It has [GetMeReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onFetchMeSuccess()` function.
  /// If the call fails, the function calls the `_onFetchMeError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  @override
  Future<void> onReady() async {
    try {
      await callFetchMe();
      _onFetchMeSuccess();
    } on GetMeResp {
      _onFetchMeError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onFetchMeSuccess() {}
  void _onFetchMeError() {}
}
