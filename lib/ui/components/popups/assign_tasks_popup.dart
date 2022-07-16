import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/config/palette.dart';
import 'package:lng/cubit/orders_cubit.dart';

import '../../../cubit/resources_cubit.dart';
import '../../../models/Resources/driver.dart';
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
  List pickUpTeam = [];
  bool allPickUpDriversSelected = false;
  bool pickUpDriverSelected = false;

  List deliveryTeam = [];
  bool allDeliveryDriversSelected = false;
  bool deliveryDriverSelected = false;

  @override
  Widget build(BuildContext context) {
    Size screeSize = MediaQuery.of(context).size;

    ResourcesState resources = BlocProvider.of<ResourcesCubit>(context).state;
    // Set drivers in pickup team
    if (pickUpTeam.isEmpty) {
      for (Driver driver in resources.pickUpTeam) {
        pickUpTeam.add({'driver': driver, 'isSelected': false});
      }
      pickUpTeam[0]['isSelected'] = true;
      pickUpTeam[1]['isSelected'] = true;
    }
    if (deliveryTeam.isEmpty) {
      for (Driver driver in resources.deliveryTeam) {
        deliveryTeam.add({'driver': driver, 'isSelected': false});
      }
      deliveryTeam[0]['isSelected'] = true;
      deliveryTeam[1]['isSelected'] = true;
    }

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
          backgroundColor: pickUpDriverSelected || deliveryDriverSelected
              ? secondaryColor
              : Colors.grey,
          textColor: pickUpDriverSelected || deliveryDriverSelected
              ? Colors.white
              : Colors.black,
          text: 'Assign Task',
          onTap: () {
            if (pickUpDriverSelected || deliveryDriverSelected) {
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

    // List view builder for pickup team list.
    Widget pickUpTeamListBuilder = ListView.builder(
      shrinkWrap: true,
      itemCount: pickUpTeam.length,
      itemBuilder: (context, index) {
        if (index % 6 == 0) {
          // List tile for section title i.e Pickup Team or Delivery Team
          return ListTile(
            onTap: () {},
            leading: const Text(
              'Pickup Team',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return ListTile(
            onTap: () {
              // Select all drivers in pickup team
              if (index == 1) {
                for (Map driver in pickUpTeam) {
                  driver['isSelected'] = true;
                }
                List newPickUpTeamState = pickUpTeam;

                setState(() {
                  pickUpTeam = newPickUpTeamState;

                  allPickUpDriversSelected = true;
                  pickUpDriverSelected = true;
                });
              } else {
                pickUpTeam[index]['isSelected'] =
                    !pickUpTeam[index]['isSelected'];
                List newPickUpTeamState = pickUpTeam;
                int numSelected = 0;
                for (Map driver in pickUpTeam) {
                  if (driver['isSelected']) {
                    numSelected += 1;
                  }
                  if (numSelected < 6) {
                    allPickUpDriversSelected = false;
                    if (numSelected > 2) {
                      pickUpDriverSelected = true;
                    } else {
                      pickUpDriverSelected = false;
                    }
                  } else {
                    allPickUpDriversSelected = true;
                    pickUpDriverSelected = true;
                  }
                }
                setState(() {
                  pickUpTeam = newPickUpTeamState;
                  allPickUpDriversSelected = allPickUpDriversSelected;
                  pickUpDriverSelected = pickUpDriverSelected;
                });
              }
            },
            leading: Container(
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 10,
                  color: index == 1
                      ? allPickUpDriversSelected
                          ? Colors.black
                          : Colors.white
                      : pickUpTeam[index]['isSelected']
                          ? Colors.black
                          : Colors.white,
                ),
              ),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.cyan, width: 1)),
            ),
            title: Text(index % 6 == 1 ? 'Select all' : 'Driver ${index - 1}'),
          );
        }
      },
    );

    // List view builder for delivery team list.
    Widget deliveryTeamListBuilder = ListView.builder(
      shrinkWrap: true,
      itemCount: deliveryTeam.length,
      itemBuilder: (context, index) {
        if (index % 6 == 0) {
          // List tile for section title i.e Pickup Team or Delivery Team
          return ListTile(
            onTap: () {},
            leading: const Text(
              'Delivery Team',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return ListTile(
            onTap: () {
              // Select all drivers in pickup team
              if (index == 1) {
                for (Map driver in deliveryTeam) {
                  driver['isSelected'] = true;
                }
                List newDeliveryTeamState = deliveryTeam;

                setState(() {
                  deliveryTeam = newDeliveryTeamState;

                  allDeliveryDriversSelected = true;
                  deliveryDriverSelected = true;
                });
              } else {
                deliveryTeam[index]['isSelected'] =
                    !deliveryTeam[index]['isSelected'];
                List newDeliveryTeamState = deliveryTeam;
                int numSelected = 0;
                for (Map driver in deliveryTeam) {
                  if (driver['isSelected']) {
                    numSelected += 1;
                  }
                }
                if (numSelected < 6) {
                  allDeliveryDriversSelected = false;
                  if (numSelected > 2) {
                    deliveryDriverSelected = true;
                  } else {
                    deliveryDriverSelected = false;
                  }
                } else {
                  allDeliveryDriversSelected = true;
                  deliveryDriverSelected = true;
                }
                setState(() {
                  deliveryTeam = newDeliveryTeamState;
                  allDeliveryDriversSelected = allDeliveryDriversSelected;
                  deliveryDriverSelected = deliveryDriverSelected;
                });
              }
            },
            leading: Container(
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 10,
                  color: index == 1
                      ? allDeliveryDriversSelected
                          ? Colors.black
                          : Colors.white
                      : deliveryTeam[index]['isSelected']
                          ? Colors.black
                          : Colors.white,
                ),
              ),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.cyan, width: 1)),
            ),
            title: Text(index % 6 == 1 ? 'Select all' : 'Driver ${index - 1}'),
          );
        }
      },
    );

    // Multiselect list to select indiividual drivers from pickup or delivery teams
    Widget generateMultiSelect() => Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom: borderSide, right: borderSide, left: borderSide),
            ),
            child: Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Column(children: [
                  // List of drivers in pickup team.
                  pickUpTeamListBuilder,
                  // List of drivers in delivery team.
                  deliveryTeamListBuilder,
                ]),
              ),
            ),
          ),
        );

    return BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, ordersState) {
      return BlocBuilder<ResourcesCubit, ResourcesState>(
          builder: (context, resourcesState) {
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    generateMultiSelect(),
                    const SizedBox(height: 5),
                    assignTaskButton,
                  ]),
            ),
          ),
        );
      });
    });
  }
}
