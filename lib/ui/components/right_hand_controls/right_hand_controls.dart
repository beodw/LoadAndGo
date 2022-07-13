import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/cubit/operational_flow_cubit.dart';
import 'package:lng/models/OperationalFlows/operational_flow.dart';
import 'tab_button.dart';
import 'dropdown.dart';

class RightHandControls extends StatefulWidget {
  const RightHandControls({Key? key}) : super(key: key);

  @override
  State<RightHandControls> createState() => _RightHandControlsState();
}

class _RightHandControlsState extends State<RightHandControls> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationalFlowCubit, OperationalFlowState>(
      builder: (context, operationalFlowState) {
        return Container(
          width: 300,
          padding: const EdgeInsets.only(right: 15, left: 15, top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabButton(
                      text: 'Task View', selected: true, onPressed: () {}),
                  const SizedBox(
                    width: 10,
                  ),
                  TabButton(
                      text: 'Team View', selected: false, onPressed: () {})
                ],
              ),

              // Search input
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 55,
                          child: Row(children: const [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                            Text('Filter', style: TextStyle(fontSize: 11)),
                          ]),
                        ),
                        const Text(
                          '15/12/2021, Unassigned',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // end search input
              // Drop down boxes
              for (OperationalFlow flow
                  in operationalFlowState.operationalFlows)
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: DropDown(
                    onTap: () => context
                        .read<OperationalFlowCubit>()
                        .setSelectedOperationalFlow(flow.code),
                    isExpanded: flow.code ==
                        operationalFlowState.selectedOperationalFlow,
                    title: Text(flow.title),
                    subtitle: const Text('120 Tasks'),
                    children: [
                      ExpansionTile(
                        title: const Text("Water Bottle Seller"),
                        subtitle: const Text('25 Tasks'),
                        children: [
                          ListTile(
                            leading: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 1)),
                            ),
                            title: const Text('Select all',
                                style: TextStyle(fontSize: 12)),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 1)),
                            ),
                            title: const Text(
                              '75 Broadway ave, Queens, NYC, 11207',
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: const Text('No recipient'),
                            onTap: () {
                              // print('sdsd');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              // End Drop Down Boxes
            ],
          ),
        );
      },
    );
  }
}
