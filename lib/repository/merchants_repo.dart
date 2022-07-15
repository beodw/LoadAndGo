import 'package:lng/utils/load_json.dart';
import '../models/merchants/merchant.dart';

class MerchantsRepo {
  ///Function to get orders returns a List of Order objects
  Future<List<Merchant>> fetchTitles() async {
    Map data = await loadData();

    //create map corresponding to loaded json data
    List<String> merchants = data['merchants'];

    //Generate a list of merchant objects from map
    List<Merchant> result = [];
    for (String title in merchants) {
      Merchant merchant = Merchant(title: title);
      result.add(merchant);
    }
    return result;
  }
}
