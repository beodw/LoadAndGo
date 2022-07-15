import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/config/palette.dart';
import 'package:lng/cubit/orders_cubit.dart';

import '../button_component/button.dart';

class AssignTasksPopUP extends StatefulWidget {
  final Function closeDialog;
  const AssignTasksPopUP({Key? key, required this.closeDialog})
      : super(key: key);

  @override
  State<AssignTasksPopUP> createState() => _AssignTasksPopUPState();
}

class _AssignTasksPopUPState extends State<AssignTasksPopUP> {
  bool driverSelected = false;
  // List of bools to mock driver data from backend.
  //Implemented as list to dave time for the sake of the challenge.
  //@todo add driver/team repo and correspondiing cubit
  List<bool> drivers = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    Size screeSize = MediaQuery.of(context).size;

    TextStyle headingStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
    TextStyle subHeadingStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );

    Widget backButton = TextButton(
      onPressed: () => widget.closeDialog(),
      child: SizedBox(
        width: 100,
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Back',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
    BorderSide borderSide = const BorderSide(color: Colors.grey, width: 0.0);

    // Assign tasks button
    Widget assignTaskButton = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          backgroundColor: driverSelected ? secondaryColor : Colors.grey,
          textColor: driverSelected ? Colors.white : Colors.black,
          text: 'Assign Task',
          onTap: () {
            if (driverSelected) {
              widget.closeDialog();
              BlocProvider.of<OrdersCubit>(context).clearSelected();
            }
          },
        ),
      ],
    );

    // Search input to search for individual driver or team.
    Widget searchInput = Container(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        border: Border.all(width: 0.0, color: Colors.grey),
      ),
      child: const Center(
        child: TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_sharp),
            border: InputBorder.none,
          ),
        ),
      ),
    );

    // Multiselect list to select indiividual drivers or teams
    Widget multiSelect = Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: borderSide, right: borderSide, left: borderSide),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              if (index % 6 == 0) {
                // @todo move this list tile to custom stateful widget.
                return ListTile(
                  onTap: () {},
                  leading: Text(
                    index == 0 ? 'Pickup Team' : 'Delivery Team',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return ListTile(
                  onTap: () {
                    setState(() {
                      // Logic for "select all" tile for pickup teams.
                      if (index == 1) {
                        for (int i = 1; i < 6; i++) {
                          drivers[i] = true;
                        }
                        driverSelected = true;
                        return;
                      }
                      // Logic for "select all" tile for delivery teams.
                      if (index == 7) {
                        for (int i = 7; i < 12; i++) {
                          drivers[i] = true;
                        }
                        driverSelected = true;
                        return;
                      }
                      drivers[index] = !drivers[index];
                      for (bool driver in drivers) {
                        if (driver) {
                          driverSelected = true;
                          return;
                        }
                      }
                      driverSelected = false;
                    });
                  },
                  leading: Container(
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 10,
                        color: drivers[index] ? Colors.black : Colors.white,
                      ),
                    ),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.cyan, width: 1)),
                  ),
                  title: Text(
                      index % 6 == 1 ? 'Select all' : 'Driver ${index - 1}'),
                );
              }
            },
          ),
        ),
      ),
    );

    return BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, ordersState) {
      return GestureDetector(
        // Gesture detector to capture clicks on the body of dialog.
        onTap: () {},
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: screeSize.width / 2.8,
            height: screeSize.height / 1.5,
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              backButton,
              const SizedBox(
                height: 20,
              ),
              Text(
                'Assign Tasks',
                style: headingStyle,
              ),
              const SizedBox(height: 10),
              Text(
                'Overview',
                style: subHeadingStyle,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('${ordersState.numSelected} task(s) selected'),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Assign driver or team'),
              const SizedBox(height: 5),
              searchInput,
              multiSelect,
              const SizedBox(height: 5),
              assignTaskButton,
            ]),
          ),
        ),
      );
    });
  }
}
