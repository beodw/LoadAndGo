import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/OperationalFlows/operational_flow.dart';

class OperationalFlowsRepo {
  ///Function to get orders returns a List of Order objects
  Future<List<OperationalFlow>> fetchFlows() async {
    //Load data from dummy_data.json file.
    //@todo create backend with firebase so operational flows can be loaded in batches from database.
    dynamic data = await rootBundle.loadString('dummy_data.json');
    data = jsonDecode(data);

    //create map corresponding to loaded json data
    Map<String, dynamic> flows = data['operationalFlows'];

    //Generate a list of flow objects from map
    List<OperationalFlow> result = [];
    for (String key in flows.keys) {
      OperationalFlow flow = OperationalFlow(
        code: flows[key]['code'],
        title: flows[key]['title'],
      );
      result.add(flow);
    }
    return result;
  }
}
