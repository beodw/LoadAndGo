import 'package:flutter/material.dart';

class MapSearchInput extends StatefulWidget {
  const MapSearchInput({Key? key}) : super(key: key);

  @override
  State<MapSearchInput> createState() => _MapSearchInputState();
}

class _MapSearchInputState extends State<MapSearchInput> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: TextField(
          controller: textController,
          cursorWidth: 1.0,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search_outlined,
              size: 20,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            fillColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
