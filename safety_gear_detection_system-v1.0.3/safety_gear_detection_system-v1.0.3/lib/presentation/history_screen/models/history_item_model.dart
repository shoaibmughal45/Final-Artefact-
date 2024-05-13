import '../../../core/app_export.dart';

/// This class is used in the [history_item_widget] screen.
class HistoryItemModel {
  HistoryItemModel({
    this.month,
    this.date,
    this.amount,
    this.price,
    this.unpaid,
    this.id,
  }) {
    month = month ?? Rx("October");
    date = date ?? Rx("30/10/2020");
    amount = amount ?? Rx("Amount");
    price = price ?? Rx("480");
    unpaid = unpaid ?? Rx("Paid");
    id = id ?? Rx("");
  }

  Rx<String>? month;

  Rx<String>? date;

  Rx<String>? amount;

  Rx<String>? price;

  Rx<String>? unpaid;

  Rx<String>? id;
}
