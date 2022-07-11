import "package:flutter/material.dart";
import "../../components/map_components/map_view.dart";
import "../../components/right_hand_controls/right_hand_controls.dart";

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
      children: const [
        MapView(),
        RightHandControls(),
      ],
    );
  }
}
