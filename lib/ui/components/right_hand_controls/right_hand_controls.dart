import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/config/palette.dart';
import 'package:lng/cubit/operational_flow_cubit.dart';
import 'package:lng/cubit/orders_cubit.dart';
import 'package:lng/models/OperationalFlows/operational_flow.dart';
import 'package:lng/ui/components/button_component/button.dart';
import 'package:lng/ui/components/right_hand_controls/drop_down_tile.dart';
import 'package:lng/ui/components/right_hand_controls/search_input.dart';
import '../../../models/Orders/order.dart';

import 'tab_button.dart';
import 'dropdown.dart';

class RightHandControls extends StatefulWidget {
  final Function showCustomDialog;
  const RightHandControls({Key? key, required this.showCustomDialog})
      : super(key: key);

  @override
  State<RightHandControls> createState() => _RightHandControlsState();
}

class _RightHandControlsState extends State<RightHandControls> {
  TextStyle DropDownTextStyle = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w200,
  );
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<OperationalFlowCubit, OperationalFlowState>(
      builder: (operationalFlowcontext, operationalFlowState) {
        return BlocBuilder<OrdersCubit, OrdersState>(
            builder: (ordersContext, orderState) {
          return Container(
            width: screenSize.width / 4.5,
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
                const SearchInput(),
                // end search input

                // Assign tasks button
                if (orderState.numSelected > 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                          text: 'Assign Tasks',
                          onTap: () {
                            widget.showCustomDialog();
                            // showDialog(
                            //     context: context,
                            //     builder: (context) => const AssignTasksPopUP());
                          },
                        ),
                      ),
                    ],
                  ),
                //end assign tasks button

                // Drop down boxes
                for (OperationalFlow flow
                    in operationalFlowState.operationalFlows)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: DropDown(
                      onTap: () {
                        operationalFlowcontext
                            .read<OperationalFlowCubit>()
                            .setSelectedOperationalFlow(flow.code);
                      },
                      isExpanded: flow.code ==
                          operationalFlowState.selectedOperationalFlow,
                      title: Text(flow.title, style: DropDownTextStyle),
                      subtitle: Text('120 Tasks', style: DropDownTextStyle),
                      children: [
                        for (Map stage in flow.stages)
                          ExpansionTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  color: stage['code'] == 'to_delivery'
                                      ? Colors.purple
                                      : stage['code'] == 'to_warehouse'
                                          ? Colors.blue
                                          : Colors.cyan,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              width: 15,
                              height: 15,
                            ),
                            title:
                                Text(stage['title'], style: DropDownTextStyle),
                            subtitle:
                                Text('25 Tasks', style: DropDownTextStyle),
                            children: [
                              // List tile for "select all" tile
                              DropDownTile(
                                leadingIcon: const Icon(
                                  Icons.format_list_bulleted,
                                  color: secondaryColor,
                                  size: 20,
                                ),
                                onTap: () {
                                  List<String> orderToSelect = [];
                                  for (Order order in orderState.orders) {
                                    if (order.stage == stage['code'] &&
                                        order.operationalFlow == flow.code) {
                                      orderToSelect.add(order.id);
                                    }
                                  }
                                  ordersContext
                                      .read<OrdersCubit>()
                                      .selectAll(orderToSelect);
                                },
                                recipient: '',
                                selected: false,
                                text: 'Select all',
                              ),
                              for (Order order in orderState.orders)
                                if (order.stage == stage['code'] &&
                                    order.operationalFlow == flow.code)
                                  DropDownTile(
                                    onTap: () {
                                      ordersContext
                                          .read<OrdersCubit>()
                                          .toggleSelectedOrder(order.id);
                                    },
                                    selected: order.isSelected,
                                    merchant: order.merchant,
                                    text: order.address,
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
        });
      },
    );
  }
}
