import 'package:flutter/material.dart';
import '../../screens/admin_screens/manage_orders.dart';
import '../../components/side_bar_component/side_bar.dart';

//Implements basic layout for web version
class BaseWebLayout extends StatelessWidget {
  const BaseWebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.centerStart,
      children: [
        Positioned.fill(
          key: const Key('0'),
          child: Navigator(
            onPopPage: ((route, result) => route.didPop(result)),
            pages: const [
              MaterialPage(child: ManageOrdersScreen()),
            ],
          ),
        ),
        const Positioned(left: 0, child: SideBar()),
      ],
    );
  }
}
