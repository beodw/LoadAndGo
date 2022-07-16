import 'package:lng/models/Resources/driver.dart';

class ResourcesRepo {
  List<Driver> getPickUpTeam() {
    List<Driver> pickUpteam = [];
    for (int i = 1; i <= 6; i++) {
      pickUpteam.add(Driver(id: '$i', name: '$i'));
    }
    return pickUpteam;
  }

  List<Driver> getDeliveryTeam() {
    List<Driver> deliveryTeam = [];
    for (int i = 1; i <= 6; i++) {
      deliveryTeam.add(Driver(id: '$i', name: '$i'));
    }
    return deliveryTeam;
  }
}
