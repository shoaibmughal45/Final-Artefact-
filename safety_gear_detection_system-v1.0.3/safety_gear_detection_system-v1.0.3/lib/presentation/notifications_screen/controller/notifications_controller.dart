import '../../../core/app_export.dart';
import '../models/notifications_model.dart';

/// A controller class for the NotificationsScreen.
///
/// This class manages the state of the NotificationsScreen, including the
/// current notificationsModelObj
class NotificationsController extends GetxController {
  Rx<NotificationsModel> notificationsModelObj = NotificationsModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;

  Rx<bool> isSelectedSwitch2 = false.obs;

  Rx<bool> isSelectedSwitch3 = false.obs;

  Rx<bool> isSelectedSwitch4 = false.obs;

  Rx<bool> isSelectedSwitch5 = false.obs;

  Rx<bool> isSelectedSwitch6 = false.obs;

  Rx<bool> isSelectedSwitch7 = false.obs;
}
