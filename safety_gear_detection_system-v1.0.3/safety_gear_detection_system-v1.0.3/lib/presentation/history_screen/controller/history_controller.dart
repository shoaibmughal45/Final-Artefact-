import '../../../core/app_export.dart';
import '../models/history_model.dart';

/// A controller class for the HistoryScreen.
///
/// This class manages the state of the HistoryScreen, including the
/// current historyModelObj
class HistoryController extends GetxController {
  Rx<HistoryModel> historyModelObj = HistoryModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in historyModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    historyModelObj.value.dropdownItemList.refresh();
  }
}
