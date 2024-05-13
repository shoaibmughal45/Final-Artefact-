import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safety_gear_detection_system/main.dart';
import 'package:safety_gear_detection_system/presentation/cards_page/models/cards_item_model.dart';
import 'package:safety_gear_detection_system/presentation/home_container_screen/controller/home_container_controller.dart';
import 'package:safety_gear_detection_system/presentation/home_page/controller/home_controller.dart';
import 'package:safety_gear_detection_system/user_model.dart';

import '../../../core/app_export.dart';
import '../models/cards_model.dart';

/// A controller class for the CardsPage.
///
/// This class manages the state of the CardsPage, including the
/// current cardsModelObj
class CardsController extends GetxController {
  CardsController(this.cardsModelObj);


   Rx<CardsModel> cardsModelObj = CardsModel().obs;

  
  @override
  Future<void> onInit() async {
        

    super.onInit();

    
  }
  


   Stream<List<CardsItemModel>> streamCards() {
    var collection = FirebaseFirestore.instance.collection('Alerts').doc(userModel.auth.currentUser!.uid).collection('Captures').orderBy('DateTime', descending: true);
    return collection.snapshots().map((snapshot) {
    
  print(snapshot.docs.length);
      return snapshot.docs.map((doc) {
        
            Rx<String> name = Rx<String>('');name.value = doc['Name']; 
Rx<String> link = Rx<String>('');
link.value = doc['Link']; 
Rx<String> imageUrl = Rx<String>('');
imageUrl.value = doc['Link']; 
Rx<Timestamp> time = Rx<Timestamp>(doc['DateTime']);

Rx<String> alertType= Rx<String>('');  
alertType.value = doc['alertType']; 
        return CardsItemModel(
          name: name,
          link: link,
          imageUrl: imageUrl,
          time: time,  // Assuming 'Time' is a Timestamp
          alertType: alertType
        );
      }).toList();
    });
  }

}