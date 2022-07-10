import "package:flutter/material.dart";
import "../../components/map_components/map_view.dart";

class RightHandControls extends StatefulWidget {
  const RightHandControls({Key? key}) : super(key: key);

  @override
  State<RightHandControls> createState() => _RightHandControlsState();
}

class _RightHandControlsState extends State<RightHandControls> {
  List operationalFlows = [
    'Pickup and delivery',
    'Pickup dispatch and delivery',
    'Pickup warehouse dispatch and deliver'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.only(right: 15, left: 15, top: 8),
      child: Column(
        children: [
          // Search input
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.only(bottom: 5),
            child: TextField(
              decoration: InputDecoration(
                label: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('15/12/2021, Unassigned')]),
                border: InputBorder.none,
                icon: Container(
                  width: 55,
                  child: Row(children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                    ),
                    Text('Filter', style: TextStyle(fontSize: 12)),
                  ]),
                ),
              ),
            ),
          ),
          // end search input
          // Drop down boxes
          for (String flow in operationalFlows)
            Container(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: ExpansionTile(
                title: Text(flow),
                subtitle: Text('120 Tasks'),
                children: [
                  ExpansionTile(
                    title: Text("Water Bottle Seller"),
                    subtitle: Text('25 Tasks'),
                    children: [
                      ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1)),
                        ),
                        title:
                            Text('Select all', style: TextStyle(fontSize: 12)),
                        onTap: () {
                          print('clicked');
                        },
                      ),
                      ListTile(
                          leading: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 1)),
                          ),
                          title: Text('75 Broadway ave, Queens, NYC, 11207',
                              style: TextStyle(fontSize: 12)),
                          subtitle: Text('No recipient'),
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            )
          // End Drop Down Boxes
        ],
      ),
    );
  }
}

class ManageOrdersScreen extends StatefulWidget {
  const ManageOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ManageOrdersScreen> createState() => _ManageOrdersScreenState();
}

class _ManageOrdersScreenState extends State<ManageOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MapView(),
        RightHandControls(),
      ],
    );
  }
}
