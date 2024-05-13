import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/app_export.dart';

/// This class is used in the [cards_item_widget] screen.
class CardsItemModel {
  CardsItemModel({
    required this.name,
 
    required this.time,
    required this.imageUrl,
    required this.link,
    required this.alertType
  }) {

  }

  Rx<String> name;


  Rx<Timestamp> time;

  Rx<String> imageUrl;

  Rx<String> link;

  Rx<String> alertType;
}
