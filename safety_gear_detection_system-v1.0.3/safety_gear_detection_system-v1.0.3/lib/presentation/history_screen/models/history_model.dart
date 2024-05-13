import 'package:safety_gear_detection_system/core/app_export.dart';
import '../../../core/app_export.dart';
import 'history_item_model.dart';

/// This class defines the variables used in the [history_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HistoryModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<HistoryItemModel>> historyItemList = Rx([
    HistoryItemModel(
        month: "October".obs,
        date: "30/10/2020".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Paid".obs),
    HistoryItemModel(
        month: "November".obs,
        date: "30/11/2020".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Unpaid".obs),
    HistoryItemModel(
        month: "December".obs,
        date: "30/12/2020".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Paid".obs),
    HistoryItemModel(
        month: "January".obs,
        date: "30/01/2021".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Pending".obs),
    HistoryItemModel(
        month: "January".obs,
        date: "30/01/2021".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Pending".obs),
    HistoryItemModel(
        month: "January".obs,
        date: "30/01/2021".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Pending".obs),
    HistoryItemModel(
        month: "January".obs,
        date: "30/01/2021".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Pending".obs),
    HistoryItemModel(
        month: "January".obs,
        date: "30/01/2021".obs,
        amount: "Amount".obs,
        price: "480".obs,
        unpaid: "Pending".obs)
  ]);
}
