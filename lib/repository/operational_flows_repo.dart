import '../models/OperationalFlows/operational_flow.dart';
import '../utils/load_json.dart';

class OperationalFlowsRepo {
  ///Function to get orders returns a List of Order objects
  Future<List<OperationalFlow>> fetchFlows() async {
    Map data = await loadData();

    //create map corresponding to loaded json data
    Map<String, dynamic> flows = data['operationalFlows'];

    //Generate a list of flow objects from map
    List<OperationalFlow> result = [];
    for (String key in flows.keys) {
      // Cast imported stages from List<dynamic> to List<String>
      List<Map> stages = flows[key]['stages'].cast<Map>();
      OperationalFlow flow = OperationalFlow(
        id: key,
        code: flows[key]['code'],
        title: flows[key]['title'],
        stages: stages,
      );
      result.add(flow);
    }
    return result;
  }
}
