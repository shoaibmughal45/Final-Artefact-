import '../../../core/app_export.dart';
import 'optionssection_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<OptionssectionItemModel>> optionssectionItemList = Rx([
    OptionssectionItemModel(
        favorite: ImageConstant.notificationsBlack.obs,
        sendMoney: "Alerts".obs,
        card: "Check Alerts".obs),
    OptionssectionItemModel(
        favorite: ImageConstant.imgNavActivityOnprimaryBlack.obs,
        sendMoney: "Analytics".obs,
        card: "In-Depth Anylisis".obs),
  
  ]);
}
