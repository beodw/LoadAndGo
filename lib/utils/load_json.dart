import 'package:flutter/services.dart';
import 'dart:convert';

dynamic loadData() async {
  //Load data from dummy_data.json file.
  //@todo create backend with firebase so operational flows can be loaded in batches from database.
  dynamic data = await rootBundle.loadString('dummy_data.json');
  return jsonDecode(data);
}
