import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/cubit/routes_cubit.dart';
import 'side_bar_tile.dart';
import 'side_bar_toggle_button.dart';
import '../../../config/palette.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  double sideBarFraction = 9;
  Duration animationDuration = const Duration(milliseconds: 150);

  int selectedIndex = 5;
  String? currentRoute;

  final List<Map> pages = [
    {
      'title': 'Dashboard',
      'icon': Icons.dashboard_outlined,
      'selected_icon': Icons.dashboard,
      'url': '/dashboard'
    },
    {
      'title': 'Assigned Orders',
      'icon': Icons.format_shapes,
      'selected_icon': Icons.dashboard_outlined,
      'url': '/assigned_orders'
    },
    {'title': 'Teams', 'icon': Icons.people_outlined, 'url': '/teams'},
    {'title': 'Fleet', 'icon': Icons.local_shipping_sharp, 'url': '/fleet'},
    {'title': 'Merchants', 'icon': Icons.storefront_sharp, 'url': '/merchants'},
    {'title': 'Orders', 'icon': Icons.pin_drop_sharp, 'url': '/orders'},
  ];

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    List<Widget> bottomButtons = [
      Material(
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            size: defaultIconSizeLg,
            color: iconPrimaryColor,
          ),
        ),
      ),
      Material(
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout_outlined,
            size: defaultIconSizeLg,
            color: iconPrimaryColor,
          ),
        ),
      ),
    ];

    return AnimatedPositioned(
      duration: animationDuration,
      left: 0,
      top: 0,
      bottom: 0,
      right: screen.width - (screen.width / sideBarFraction),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // SideBar contents
        Expanded(
          child: Container(
            color: Colors.white.withOpacity(1.0),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    Text(
                      'LnG',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.15),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: const CircleAvatar(
                        foregroundImage:
                            AssetImage('images/cool_profile_pic.jpeg'),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SideBarTile(
                            isSelected: index == selectedIndex,
                            icon: pages[index]['icon'],
                            onPressed: () {
                              // set state on sidebar selectedIndex to change selected button
                              setState(() {
                                selectedIndex = index;
                              });
                              // set url on routes cubit to render new page
                              context
                                  .read<RoutesCubit>()
                                  .setRoute(pages[index]['url']);
                            },
                            title: pages[index]['title'],
                            sideBarIsOpen: isOpen);
                      },
                    ),
                  ]),
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.center,
                  child: isOpen
                      ? Row(
                          children: bottomButtons,
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      : Column(
                          children: bottomButtons,
                        ),
                ),
              ],
            ),
          ),
        ),
        // End SideBar contents
        SideBarToggleButton(
          isOpen: isOpen,
          toggle: () {
            setState(() {
              isOpen = !isOpen;
              sideBarFraction =
                  isOpen ? sideBarFraction / 2 : sideBarFraction * 2;
            });
          },
          sideBarFraction: sideBarFraction,
        ),
      ]),
    );
  }
}
