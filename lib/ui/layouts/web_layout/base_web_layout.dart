import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/routes_cubit.dart';
import '../../components/popups/assign_tasks_popup.dart';
import '../../components/popups/dialog_bg.dart';
import '../../screens/admin_screens/manage_orders.dart';
import '../../components/side_bar_component/side_bar.dart';
import '../../screens/not_yet_implemented.dart';

///Implements basic layout for web version
class BaseWebLayout extends StatefulWidget {
  const BaseWebLayout({Key? key}) : super(key: key);

  @override
  State<BaseWebLayout> createState() => _BaseWebLayoutState();
}

class _BaseWebLayoutState extends State<BaseWebLayout> {
  String currentRoute = '/';
  bool dialogOpen = false;

  @override
  Widget build(BuildContext context) {
    // Routes map links urls to widget.
    Map routes = {
      '/orders': ManageOrdersScreen(
          showCustomDialog: () => setState(() {
                dialogOpen = true;
              })),
      '/merchants': const NotYetImplemented(),
      '/fleet': const NotYetImplemented(),
      '/teams': const NotYetImplemented(),
      '/assigned_orders': const NotYetImplemented(),
      '/dashboard': const NotYetImplemented(),
    };
    // Base for map, sidebar, and right hand controls.
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.centerStart,
      children: [
        Positioned.fill(
          key: const Key('0'),
          child: BlocBuilder<RoutesCubit, String>(
            builder: (context, currentRoute) {
              return Navigator(
                onPopPage: ((route, result) => route.didPop(result)),
                pages: [
                  MaterialPage(
                    maintainState: false,
                    child: routes[currentRoute],
                  ),
                ],
              );
            },
          ),
        ),
        const SideBar(),
        if (dialogOpen)
          DialogBG(
            dialog: AssignTasksPopUP(
              closeDialog: () => setState(() {
                dialogOpen = false;
              }),
            ),
            onTap: () => setState(() {
              dialogOpen = false;
            }),
          ),
      ],
    );
  }
}
